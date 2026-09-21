## Prerequisites

```sh
brew install stow zellij
brew install --cask ghostty
```

## Installing oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Linking dotfiles with stow

```sh
stow -t ~ ghostty git nvim pi zellij zsh
```

Stow refuses to link over existing regular files, so remove any of them first:

```sh
rm ~/.config/zellij/config.kdl
rm ~/.pi/agent/settings.json
```

## Unlinking dotfiles with stow

```sh
stow -t ~ -D ghostty git nvim pi zellij zsh
```
