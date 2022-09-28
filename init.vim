" Basic configs
set number
set relativenumber
set tabstop=4
set shiftwidth=4
syntax enable
set updatetime=250
set mouse=a
let mapleader = " "
set nowrap
set scrolloff=8
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
nmap <leader>w :w!<cr>
nmap <leader>qq :bd<cr>
nmap <leader>qa :bufdo bd<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
set incsearch
set nobackup
set nowb
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile

" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" --- Plugins

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'kyazdani42/nvim-web-devicons'                " Devicons
Plug 'nvim-lualine/lualine.nvim'                   " Status line
Plug 'akinsho/bufferline.nvim'                     " Buffers
Plug 'machakann/vim-highlightedyank'               " Highlight yanked text
Plug 'kyazdani42/nvim-tree.lua'                    " File explorer
Plug 'ii14/onedark.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}   " Terminal
Plug 'windwp/nvim-autopairs'					   " Pairing
" Lsp
Plug 'neovim/nvim-lspconfig'     
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'kazhala/close-buffers.nvim'
Plug 'pantharshit00/vim-prisma'
" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

lua require('alaricode')


" --- Colors

set background=dark
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

" --- Remaps

nnoremap <leader>h :wincmd h<Cr>
nnoremap <leader>j :wincmd j<Cr>
nnoremap <leader>k :wincmd k<Cr>
nnoremap <leader>l :wincmd l<Cr>
nnoremap <leader>[ :BufferLineCyclePrev<Cr>
nnoremap <leader>] :BufferLineCycleNext<Cr>
nnoremap <silent><leader>q :bdelete<Cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

" Window navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

