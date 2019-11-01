" enable panthogen
execute pathogen#infect()

set runtimepath+=~/.vim-plugins/LanguageClient-neovim

" basic vim command to enable extra feature in vim
set nocompatible              " be iMproved, required
set number
syntax on             " Enable syntax highlighting
filetype plugin indent on
filetype on
filetype indent on
set cursorline
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow

" configuration for oceanicNext colorschema
let g:airline_theme='oceanicnext'

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

let g:ycm_use_ultisnips_completer = 1

" YouCompleteMe configuration
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"

let g:LanguageClient_serverCommands = { 'ruby': ['solargraph', 'stdio'] }
let g:LanguageClient_autoStart=1
let g:LanguageClient_autoStop=1

autocmd Filetype python,c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby,eruby,scss setlocal expandtab shiftwidth=2 tabstop=2

" ruby configuration
let g:vimrubocop_config = '~/rubocop.yaml'
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" emmet configuration
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
