let mapleader=","

" Enable packages
:packadd! sensible
:packadd! surround
:packadd! better-whitespace

" Packages not enabled for VSCode
if !exists('g:vscode')
    " VSCode performs lastplace by itself
    :packadd! lastplace
    " Use the VSCode plugin 'editorconfig.editorconfig' instead
    :packadd! sleuth
    " Use the VSCode plugin 'Catppuccin.catppuccin-vsc' instead
    :packadd! catppuccin
    colorscheme catppuccin-latte
endif

set hlsearch
set mouse=a
set scrolloff=3
set nostartofline
set number
set relativenumber
set ignorecase
set smartcase

" Copy/paste to/from the system secondary buffer
vmap <leader>c "+y
nmap <leader>p "+p

" Disable highlight
map <silent> <leader><CR> :noh<CR>

" StripWhitespace (if package was succesfully added)
au VimEnter * if exists(":StripWhitespace") | exe "noremap <leader>ss :StripWhitespace<CR>" | endif

" Use displayed lines for k andj
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
