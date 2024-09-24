if status is-interactive
    if test -d "$HOME/.local/share/cheznous"
        alias 'cheznous' "chezmoi -S $HOME/.local/share/cheznous -c $HOME/.config/chezmoi/cheznous.toml --persistent-state $HOME/.config/chezmoi/cheznousstate.boltdb"
    end
end
