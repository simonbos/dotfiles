# https://junegunn.github.io/fzf/tips/ripgrep-integration/
function rfv
    set -l RELOAD 'reload:rg --column --color=always --smart-case {q} || :'
    set -l OPENER 'if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
                     nvim {1} +{2};     # No selection. Open the current line in Vim.
                   else
                     nvim +cw -q {+f};  # Build quickfix list for the selected items.
                   fi'

    fzf --ansi --disabled \
                --bind "start:$RELOAD" --bind "change:$RELOAD" \
                --bind "enter:execute:bash -c \"$OPENER\"" \
                --delimiter ':' \
                --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
                --preview-window '~4,+{2}+4/3,<80(up)' \
                --query "$argv"
end
