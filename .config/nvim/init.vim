syntax on

:imap jj <Esc>
:imap JJ <Esc>
:set relativenumber
:set number
:set noswapfile
:set smartindent
:set incsearch
:set ignorecase
:set spelllang=it 
:set scrolloff=3
:set nocompatible
filetype plugin on
:set ttimeoutlen=100
"set termguicolors
:set updatetime=2000

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"inoremap {; {<CR>};<C-c>O
"inoremap {, {<CR>},<C-c>O
"inoremap [; [<CR>];<C-c>O
"inoremap [, [<CR>],<C-c>O
"inoremap {<Enter> {<CR>}<C-c>O
"inoremap [<Enter> [<CR]<C-c>O
nnoremap <silent> <F11> :set spell! <cr>
inoremap <silent> <F11> <C-O>:set spell! <cr>
inoremap <leader><space> <ESC>la
inoremap fj <C-o>dvb


" Nerdtree settings 
nnoremap <F6> :NERDTreeToggle<CR>
inoremap <F6> <C-o>:NERDTreeToggle<CR>
let NERDTreeShowHidden=1


"dashboard settings
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>



" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0


"vim ariline settings
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1


" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <C-f> :Files<CR>
