## Installing oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Linking dotfiles with stow

```sh
stow -t ~ git nvim tmux zsh
```

## Unlinking dotfiles with stow

```sh
stow -t ~ -D git nvim tmux zsh
```
