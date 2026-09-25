# ------------------------------------------------------------------------------
# -> Environment
# ------------------------------------------------------------------------------

test -x /opt/homebrew/bin/brew; and /opt/homebrew/bin/brew shellenv | source

set -gx EDITOR nvim
set -gx LANG en_US.UTF-8

fish_add_path -g $HOME/bin $HOME/.local/bin

# ------------------------------------------------------------------------------
# -> Interactive
# ------------------------------------------------------------------------------

# No greeting; the prompt is enough.
set -g fish_greeting

if status is-interactive
    command -q fnm && fnm env --shell fish | source
    command -q fzf && fzf --fish | source
end

# fd walks instead of find, so .gitignore is respected and node_modules never shows up in the picker.
if command -q fd
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
end

if command -q bat
    set -gx BAT_THEME ansi
    set -gx MANPAGER "sh -c 'col -bx | bat --language man --plain'"
    set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range=:200 {}' --bind ctrl-v:toggle-preview"
    set -gx FZF_ALT_C_OPTS "--preview 'fd --max-depth 1 --color=always . {}' --bind ctrl-v:toggle-preview"
end

# ------------------------------------------------------------------------------
# -> Git
# ------------------------------------------------------------------------------

# Commit history in fzf with the full diff alongside. Prints the chosen sha, so it
# composes: `git show (glog)`, `git revert (glog)`. Arguments go through to git log,
# so `glog -- nvim` limits it to one path.
function glog --description 'fzf over git log, delta previews the commit'
    git log --color=always --date=short \
        --format='%C(auto)%h %C(blue)%ad%C(auto)%d %s %C(dim)%an' $argv |
        fzf --ansi --no-sort \
            --preview 'git show --color=always {1} | delta --width=$FZF_PREVIEW_COLUMNS' |
        read -l commit
    and string split -f1 ' ' -- $commit
end

# Complete glog's arguments the way git log's are completed.
complete -c glog -w 'git log'

# ------------------------------------------------------------------------------
# -> Prompt
# ------------------------------------------------------------------------------

fish_config prompt choose minimalist

function fish_right_prompt --description 'Muted git segment beside the prompt'
    fish_git_prompt '%s'
end

set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_char_dirtystate '-'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_char_untrackedfiles ''
set -g __fish_git_prompt_color 727169

# ------------------------------------------------------------------------------
# -> Colors
# ------------------------------------------------------------------------------

fish_config theme choose nord

set -g fish_color_cwd 98bb6c
