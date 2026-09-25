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
    if command -q fzf
        fzf --fish | source

        bind --erase ctrl-t
        bind --erase -M insert ctrl-t
        bind alt-t fzf-file-widget
        bind -M insert alt-t fzf-file-widget

        bind --erase ctrl-r
        bind --erase -M insert ctrl-r
        bind alt-r fzf-history-widget
        bind -M insert alt-r fzf-history-widget
    end
end

# fd walks instead of find, so .gitignore is respected and node_modules never shows up in the picker.
if command -q fd
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
end

# ------------------------------------------------------------------------------
# -> Prompt
# ------------------------------------------------------------------------------

fish_config prompt choose minimalist

function fish_right_prompt --description 'Muted git segment beside the prompt'
    fish_git_prompt '%s'
end

set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_stagedstate ''
set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_char_untrackedfiles ''
set -g __fish_git_prompt_color 727169

# ------------------------------------------------------------------------------
# -> Colors
# ------------------------------------------------------------------------------

fish_config theme choose nord

set -g fish_color_cwd 98bb6c
