let g:mapleader = ' '
set number
set relativenumber
set encoding=utf-8
syntax on
filetype plugin indent on
set ts=2 sts=2 sw=2 et ai si
set mouse=a " Allow to use the mouse in the editor
set cursorline " Highlights the current line in the editor
set title " Show file title
set wildmenu
set guicursor="n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
set term=xterm-256color
set t_Co=256

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
" Plug coc.nvim for lsp
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'hachy/eva01.vim',
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'Debajyati/turboterm.vim', { 'tag': '*' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'thinca/vim-quickrun'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()

colorscheme catppuccin_frappe
" colorscheme onehalfdark
let g:airline_theme = 'night_owl'

set bg=dark
let g:bargreybars_auto=0
let g:airline_solarized_bg="dark"
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enabled=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
let g:airline#extensions#coc#enabled = 1

set termguicolors

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>fe :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:codeium_enabled = v:false

" very broad config for coc.nvim to take effect in vim 
 " Some servers have issues with backup files, see #649 of coc.nvim repository
 " for references.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" use <tab> key to trigger completion with navigating to the characters ahead.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in the configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" KeyMaps for fuzzy finder
nnoremap <silent><space>b :Buffers<CR>
nnoremap <silent><space>ff :Files<Cr>

" More Keymaps 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <leader>th :Colors<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><space>1 :source ~/.vimrc \| :PlugInstall<CR>
"custom binding to see quick uninteractive output:
nnoremap <silent><space>r :QuickRun<CR>

set backspace=indent,eol,start  "powerful backspacing

"set omnifunc=javascriptcompleteCompleteJS
"set omnifunc=tmlcomplete#CompleteTags
"set omnifunc=csscomplete#CompleteCSS
"set omnifunc=phpcomplete#CompletePHP

" Disable visualbell
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard+=unnamedplus
endif

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
