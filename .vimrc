syntax on
filetype plugin indent on
let mapleader = ","
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0
inoremap jk <ESC>
map <silent> <C-n> :NERDTreeToggle<CR>
set shiftwidth=2
set tabstop=2
set et
set nu
set hlsearch
set autoindent 
set smartindent
color desert
inoremap ( ()<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
set relativenumber
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
call pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
if $TMUX == ''
    set clipboard+=unnamed
endif
