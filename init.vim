call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" vim rainbow
Plug 'luochen1990/rainbow'

Plug 'jszakmeister/vim-togglecursor'

Plug 'jiangmiao/auto-pairs'

Plug 'lepture/vim-jinja'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular'
call plug#end()

" ctrlp vim configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim

" set  stuff
syntax on
set mouse=a
set mousehide
set clipboard+=unnamedplus
set ignorecase
set number
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

" filetype configuration
filetype plugin indent on
filetype on
filetype indent on
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow

" interface
set termguicolors " enable terminal colors
set number " show line number
set cursorline " highlight current number

" misc
set confirm " set confirmation when quit from not saved file

" gruvbox configuration
colorscheme gruvbox
"colorscheme space-vim-dark
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" file type configuration
autocmd FileType python,c,cpp,json,php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby,eruby,scss,css,javascript,jsx,html setlocal expandtab shiftwidth=2 tabstop=2

" NERDTree configuration
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <c-x> :NERDTreeToggle<CR>
nmap <c-b> :CtrlPBuffer<CR>

" FZF configuration
nmap <c-f> :FZF<CR>

" languange client configuration
let g:LanguageClient_serverCommands = { 'ruby': ['solargraph', 'stdio'] }
let g:LanguageClient_autoStart=1
let g:LanguageClient_autoStop=1

" set airline-vim configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_theme='gruvbox'

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

let g:ctrlp_map = '<c-p>'


nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
let g:rainbow_active = 1
let g:jedi#completions_enabled = 1

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" FZF {{{
" 
" by @syphar
" github.com/syphar/dotfiles
"let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.4) " 40% of screen
  let width = float2nr(&columns * 0.7) " 70% of screen
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr(&lines * 0.1) " space to top: 10%

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'anchor': 'NW',
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" }}}
