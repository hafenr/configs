# dotfiles (chezmoi)

Configs are managed by [chezmoi](https://chezmoi.io) and rendered as real files in `$HOME`.

## New macOS setup

```sh
# 1. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install chezmoi, clone this repo, and apply (writes the dotfiles)
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply git@github.com:hafenr/configs.git

# 3. Packages (chezmoi wrote the Brewfile to ~/.Brewfile)
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
