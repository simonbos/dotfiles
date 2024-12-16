if status is-interactive
    # Abbreviations
    abbr --add '..' 'cd ..'
    abbr --add '...' 'cd ../..'
    abbr --add '....' 'cd ../../..'
    abbr --add '.....' 'cd ../../../..'
    abbr --add '......' 'cd ../../../../..'
    abbr --add 'cat' 'bat'
    abbr --add 'htop' 'btm -b'
    abbr --add 'g' 'git'
    abbr --add 'la' 'eza -alF'
    abbr --add 'ls' 'eza'
    abbr --add 'tree' 'eza -aT'
    abbr --add 'ff' 'fzf-file-widget'
    abbr --add 'fj' 'fzf-cd-widget'
    abbr --add 'rg' 'rg -.i'
    abbr --add 'vim' 'nvim'

    # FZF options
    # See https://github.com/catppuccin/fzf for the colorscheme.
    set -g -x FZF_DEFAULT_COMMAND 'fd --type f'
    set -g -x FZF_DEFAULT_OPTS "\
        --reverse \
        --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
        --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
        --color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
        --color=selected-bg:#bcc0cc"
    set -g -x FZF_CTRL_T_COMMAND 'fd --type f'
    set -g -x FZF_CTRL_T_OPTS '--preview \'bat --style=numbers --color=always --line-range :500 {}\''
    set -g -x FZF_ALT_C_COMMAND 'fd --type d'
    set -g -x FZF_ALT_C_OPTS '--preview \'eza --tree {} | head -200\''

    # Fish stuff
    set -g -x EDITOR 'nvim'
    set -g fish_greeting
    set -g fish_autosuggestion_enabled 0
    set -g fish_key_bindings fish_default_key_bindings
    bind \t 'if not commandline --paging-full-mode; commandline -f complete; end'

    # Shell colors
    set -g -x EZA_COLORS "$(vivid generate catppuccin-latte)"
    set -g -x LS_COLORS "$EZA_COLORS"

    # Initialize shell integrations
    zoxide init fish | source
    abbr --add 'z' 'zi'
    starship init fish | source
    direnv hook fish | source
end
