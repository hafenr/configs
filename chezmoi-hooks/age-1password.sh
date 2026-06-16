#!/usr/bin/env bash
# age wrapper for chezmoi that sources the private identity from 1Password,
# never persisting it. Set as chezmoi's [age] command.
#
# chezmoi invokes the age command (per internal/chezmoi/ageencryption.go) as:
#   decrypt:  age --decrypt [--identity <file> ...] [--output <path>] <args>  (ciphertext on stdin)
#   encrypt:  age --armor --encrypt [--recipient <r> ...] <args>             (plaintext on stdin / file arg)
# If chezmoi changes that contract, this wrapper must be updated.
#
# For decryption we drop chezmoi's --identity argument (it points at a path
# that does not exist on disk) and substitute a freshly-fetched key written to
# a private tmpfile that is shredded on exit (atomic within this process — no
# reliance on chezmoi hook timing). Encryption needs no identity, so it is
# passed straight through.
set -euo pipefail

OP_URI="op://Personal/dotfiles age key/notesPlain"
AGE_BIN="${CHEZMOI_AGE_BIN:-age}"

# Detect decrypt vs encrypt and rebuild args, stripping any --identity <file>
# pair (we supply our own identity for decrypt only).
is_decrypt=0
out_args=()
while [ $# -gt 0 ]; do
    case "$1" in
        --decrypt|-d)
            is_decrypt=1
            out_args+=("$1")
            shift
            ;;
        --identity|-i)
            # drop chezmoi's identity path (and its value); we inject our own
            shift 2
            ;;
        *)
            out_args+=("$1")
            shift
            ;;
    esac
done

# Encryption needs no identity: run age directly (exec is fine, no key on disk).
if [ "$is_decrypt" -ne 1 ]; then
    exec "$AGE_BIN" "${out_args[@]}"
fi

# Decryption: fetch the key to a private tmpfile, run age as a CHILD (NOT exec,
# so the EXIT trap fires and shreds the key), then propagate age's exit status.
keyfile="$(mktemp "${TMPDIR:-/tmp}/chezmoi-age.XXXXXX")"
trap 'rm -fP "$keyfile" 2>/dev/null || rm -f "$keyfile"' EXIT INT TERM HUP
chmod 600 "$keyfile"
op read "$OP_URI" | sed -n '/AGE-SECRET-KEY/p' > "$keyfile"
if [ ! -s "$keyfile" ]; then
    echo "age-1password: empty identity from 1Password ($OP_URI)" >&2
    exit 1
fi
"$AGE_BIN" "${out_args[@]}" --identity "$keyfile"
exit $?
