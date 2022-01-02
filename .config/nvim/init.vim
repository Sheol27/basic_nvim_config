syntax on

:imap jj <Esc>
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
Plug 'sirver/ultisnips'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
"Plug 'itchyny/calendar.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'glepnir/dashboard-nvim'
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

call plug#end()

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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

nnoremap <leader> j <C-W>j
nnoremap <leader> k <C-W>k
nnoremap <leader> h <C-W>h
nnoremap <leader> l <C-W>l
nnoremap <leader> q <C-W>q


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

:command R :w | :!pdflatex %  
:command O :silent ! file=% && zathura --config-dir "~/.config/zathura/" ${file\%.*}.pdf &  
:command -nargs=1 S :silent ! grim -g "$(slurp)" images/<f-args>.png "save screenshots in order to open them inside tex files
:command Convert ! pandoc -V geometry:margin=1in "%" -f vimwiki -t pdf -s -o ~/Documents/Essays/"%:t:r.pdf"
:command P :w | :! python3.10 % 

hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0

"use of enter key for completition 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"prettier command 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"vim ariline settings
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

"vimwiki
"let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_list = [{'auto_diary_index': 1}]
let g:vimwiki_table_mappings = 0

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <C-f> :Files<CR>



"Help ultisnips to be smoother 
let g:loaded_python_provider = 1
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'

"This aswell 
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END

"Autosaves when using tex files 
if &filetype ==# 'tex' || &filetype ==# 'plaintex'
    autocmd CursorHold,CursorHoldI <buffer> silent! :R
endif

if &filetype ==# 'vimwiki'
    autocmd CursorHold,CursorHoldI <buffer> silent! write
endif

autocmd TextChanged,TextChangedI *.wiki silent write

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF




colorscheme wal
