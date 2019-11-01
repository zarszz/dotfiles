call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'

"Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" css color-preview
Plug 'ap/vim-css-color'

" plugin for git purposes
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" enable file icon
Plug 'ryanoasis/vim-devicons'

" elixir plugin
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'

" rails plugin
Plug 'tpope/vim-rails'

" plugin for help indentation
Plug 'nathanaelkane/vim-indent-guides'

" for auto add end
Plug 'tpope/vim-endwise'

" for multiple select
Plug 'terryma/vim-multiple-cursors'

" view line indention
Plug 'Yggdroot/indentLine'

" easy motion
Plug 'easymotion/vim-easymotion'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" ctrlp vim configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim

" vim basic configuration
syntax on
set number
set cursorline
set mouse=a
set clipboard+=unnamedplus
filetype plugin indent on
filetype on
filetype indent on
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow

" gruvbox configuration
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark = 'medium'

" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" file type configuration
autocmd FileType python,c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby,eruby,scss,css,javascript,jsx setlocal expandtab shiftwidth=2 tabstop=2

" NERDTree configuration
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <c-x> :NERDTreeToggle<CR>

" languange client configuration
let g:LanguageClient_serverCommands = { 'ruby': ['solargraph', 'stdio'] }
let g:LanguageClient_autoStart=1
let g:LanguageClient_autoStop=1

" set airline-vim configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1

" easymotioon vim configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
