# dotfiles (chezmoi)

Configs are managed by [chezmoi](https://chezmoi.io) and rendered as real files in
`$HOME`. Secrets are encrypted with [age]; the private key lives in 1Password.

## New macOS setup

```sh
# 1. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. age key — place the private key BEFORE applying, or secrets won't decrypt.
#    (skip if you have no encrypted files yet)
brew install --cask 1password-cli && eval "$(op signin)"
mkdir -p ~/.config/chezmoi
op read 'op://Personal/dotfiles age key/notesPlain' \
  | sed -n '/AGE-SECRET-KEY/p' > ~/.config/chezmoi/key.txt
chmod 600 ~/.config/chezmoi/key.txt

# 3. Install chezmoi, clone this repo, and apply (writes the dotfiles)
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply git@github.com:hafenr/configs.git

# 4. Packages (chezmoi wrote the Brewfile to ~/.Brewfile)
brew bundle --global
```

### Set up separately
- oh-my-zsh: install via its script; the `qzr` theme is written to `~/.oh-my-zsh/custom/themes/`.
- vim-plug: included at `~/.vim/autoload/plug.vim`; run `:PlugInstall` in vim.

## Day-to-day

Managed files are real copies, so source edits must be applied (and edits made
directly in `$HOME` must be pulled back):

```sh
chezmoi edit ~/.zshrc   # edit the source for a file, then apply
chezmoi apply           # write source -> $HOME
chezmoi re-add          # pull changes made directly in $HOME back into the source
chezmoi cd              # jump to the repo (then: git add/commit/push)
```

## Secrets (age)

The private age key must be at **`~/.config/chezmoi/key.txt`** (`chmod 600`, never
committed). It is stored in 1Password at `op://Personal/dotfiles age key`; place it
with the command in step 2 above. The public recipient is in `.chezmoi.toml.tmpl`
(safe to commit) and is all that's needed to *encrypt*.

```sh
chezmoi add --encrypt ~/.config/foo/secret   # encrypt a new secret into the repo
chezmoi edit ~/.config/foo/secret            # edit an encrypted secret in place
```

Encrypted secrets are stored as `encrypted_*.age` and decrypted to real files on
`chezmoi apply`. If `apply` errors with a decryption failure, `key.txt` is missing.

## Updating the Brewfile

`brew bundle dump` lists every installed formula, including transitive
dependencies. To keep only the packages explicitly installed (deps get pulled
in automatically on `brew bundle`), regenerate from the requested leaves into the
chezmoi source file `dot_Brewfile`:

```sh
cd "$(chezmoi source-path)"
brew leaves --installed-on-request > /tmp/leaves
brew bundle dump --file=/tmp/Brewfile.full --describe --force
awk 'BEGIN{while((getline l<"/tmp/leaves")>0)keep[l]=1}
  /^#/{d=substr($0,3);next}
  /^brew "/{n=$0;sub(/^brew "/,"",n);sub(/".*/,"",n);
    if(n in keep)print $0 (d?"  # "d:""); d="";next}
  /^(tap|cask|npm) /{print $0 (d?"  # "d:"");d="";next}
  {print;d=""}' /tmp/Brewfile.full > dot_Brewfile
chezmoi apply ~/.Brewfile
```

Keeps all taps, casks and npm entries plus only the explicitly-requested
formulae, with each description as an inline `  #` comment.

[age]: https://age-encryption.org
