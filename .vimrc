" enable panthogen
execute pathogen#infect()

" basic vim command to enable extra feature in vim
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
set cursorline
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow


" configuration for oceanicNext colorschema
"if (has("termguicolors")) 
"	set termguicolors 
"endif
"colorscheme OceanicNext
let g:airline_theme='oceanicnext'
"let g:oceanic_next_terminal_bold = 1
" end of configuration


" enable mouse mode
set mouse=a


" gruvbox configuration file
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark = 'medium'
"end of configuration


" open NERDTree when vim open an directory
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <c-x> :NERDTreeToggle<CR>


" set airline-vim configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1


" vim syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" vim ulti-snips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" YouCompleteMe configuration
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 0

let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"

"set number
set number
set cpoptions+=n


" ruby configuration
let g:rubycomplete_buffer_loading = 1 
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:vimrubocop_config = '~/rubocop.yaml'


if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
	    \   if &omnifunc == "" |
	    \           setlocal omnifunc=syntaxcomplete#Complete |
	    \   endif
endif

" java configuration
autocmd FileType java setlocal omnifunc=javacomplete#Complete
