# dotfiles

```sh
brew bundle --file=Brewfile
brew install stow
stow vim zsh bash tmux emacs ideavim yabai skhd claude
```

## Updating the Brewfile

`brew bundle dump` lists every installed formula, including transitive
dependencies. To keep only the packages explicitly installed (deps get pulled
in automatically on `brew bundle`), regenerate from the requested leaves:

```sh
brew leaves --installed-on-request > /tmp/leaves
brew bundle dump --file=/tmp/Brewfile.full --describe --force
awk 'BEGIN{while((getline l<"/tmp/leaves")>0)keep[l]=1}
  /^#/{d=substr($0,3);next}
  /^brew "/{n=$0;sub(/^brew "/,"",n);sub(/".*/,"",n);
    if(n in keep)print $0 (d?"  # "d:""); d="";next}
  /^(tap|cask|npm) /{print $0 (d?"  # "d:"");d="";next}
  {print;d=""}' /tmp/Brewfile.full > Brewfile
```

Keeps all taps, casks and npm entries plus only the explicitly-requested
formulae, with each description as an inline `  #` comment.
