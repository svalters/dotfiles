## Prerequisites

```sh
brew install stow git neovim fnm zellij fzf fd ripgrep bat
brew install --cask ghostty
```

## Linking dotfiles with stow

```sh
mkdir -p ~/.config/ghostty ~/.config/zellij ~/.config/nvim ~/.config/git ~/.config/fd

stow --dotfiles -t ~ zsh
stow -t ~/.config/ghostty ghostty
stow -t ~/.config/zellij zellij
stow -t ~/.config/nvim nvim
stow -t ~/.config/git git
stow -t ~/.config/fd fd
```

## Unlinking dotfiles with stow

```sh
stow --dotfiles -t ~ -D zsh
stow -t ~/.config/ghostty -D ghostty
stow -t ~/.config/zellij -D zellij
stow -t ~/.config/nvim -D nvim
stow -t ~/.config/git -D git
stow -t ~/.config/fd -D fd
```
