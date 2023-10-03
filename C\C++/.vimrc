set number
syntax on "Enabling syntax highlighting
filetype plugin indent on
set ts=2 sts=2 sw=2 et ai si
set mouse=a " Allow to use the mouse in the editor
set cursorline " Highlights the current line in the editor
set title " Show file title


call plug#begin('~/.vim/plugged')
" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline'
" Plug coc.nvim for C/C++ lsp
Plug 'neoclide/coc.nvim'
" Plugin for autopairing of brackets and quotations
Plug 'jiangmiao/auto-pairs'
" Plugin for changing themes of vim-airline
Plug 'vim-airline/vim-airline-themes'
" Plugin to install & set colorscheme to Gruvbox which suits the lsp suggessions
Plug 'gruvbox-community/gruvbox'
" Plug Nerdtree to have a short File-Explorer Utility on the left of your vim-window
Plug 'preservim/nerdtree'
" Plugin to make sure your vim works the same inside tmux also
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

colorscheme gruvbox "Setting colorscheme as Gruvbox
set termguicolors

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

set bg=dark " setting background theme as dark

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  map <C-n> :NERDTreeToggle<CR> " mapping `Ctrl+n` as our default vim keybinding for opening and closing NERDTree (explorer)  
