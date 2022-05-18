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

" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'yassinebridi/vim-purpura'
Plug 'mihaifm/bufstop'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc-eslint'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-commentary'
Plug 'wookayin/fzf-ripgrep.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }

call plug#end()

" Prettier configs
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Coc configs
let g:coc_global_extensions = ['coc-tsserver']

" Airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'purpura'
let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %3v')

" Theme
if (has("termguicolors"))
  set termguicolors
endif
colorscheme purpura
set background=dark
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" Vimspecter Config
let g:vimspector_enable_mappings = 'HUMAN'

" GitGutter
let g:gitgutter_override_sign_column_highlight = 1

" Floaterm
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_height=0.8

" REMAPS ------------------------------------------
" Autocomplete
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Window navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Moving lines
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Keymap Coc
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Nerdtree navigation
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Floaterm
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_height=0.8

" Buffers navigation
map <leader>b :Bufstop<CR>
let g:BufstopAutoSpeedToggle = 1

" Fzf maps
map <Leader>ff :Files<CR>
map <Leader>fb :BLines<CR>
map <Leader>fa :Rg<CR>
let $FZF_DEFAULT_COMMAND = 'fd --type f'

" Show docs keys
map <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
