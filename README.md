## Prerequisites

```sh
brew install stow fish zellij fzf fd ripgrep bat git-delta
brew install --cask ghostty
```

## Linking dotfiles with stow

```sh
mkdir -p ~/.config/fish ~/.config/ghostty ~/.config/zellij ~/.config/nvim ~/.config/git \
  

stow -t ~/.config/fish fish
stow -t ~/.config/ghostty ghostty
stow -t ~/.config/zellij zellij
stow -t ~/.config/nvim nvim
stow -t ~/.config/git git
```

## Making fish the login shell

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## Unlinking dotfiles with stow

```sh
stow -t ~/.config/ghostty -D ghostty
stow -t ~/.config/zellij -D zellij
stow -t ~/.config/nvim -D nvim
stow -t ~/.config/git -D git
stow -t ~/.config/fish -D fish
```
