"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"===========default setting
set ts=4
set sts=4
set sw=4
set smarttab
set expandtab
"set cindent
set smartindent
"set autoindent
set nowrap
set ff=unix
set bg=dark
set ruler
"specify folders to be searched
set path=/usr/include,/usr/local/include,/usr/src/include,/BSP/kernel/kernel-3.4.39
set nu
set fileencodings=euc-kr,utf-8
"=========== ab, ia
ab 메일 jhlim@plk.co.kr
ia 시간0 <C-R>=strftime("%Y.%m.%d-%H:%M:%S")<CR>
ia ndkfs0 <C-R>=strftime("%Y.%m.%d-%H:%M:%S")<CR>
ia 시간1 <C-R>=strftime("%c")<CR>
ia ndkfs1 <C-R>=strftime("%c")<CR>

"===========key mapping
"folding
map <F1> v]}zf
"unfolding
map <F2> zo
"Taglist plugin
map <F3> :TlistToggle <cr><C-W><C-W>
map <F4> :TagbarToggle <cr><C-W><C-W>
map <F7> :NERDTreeToggle <cr><C-W><C-W>
"Buffer Explorer plugin
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"===========indent on/off
map ,noi :set noai<CR>:set nocindent<CR>:set nosmartindent<CR>
map ,sei :set ai<CR>:set cindent<CR>:set smartindent<CR>

"===========moving between file buffers
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!10<CR>
map ,x :bn!<CR>       "next buffer
map ,z :bp!<CR>       "previous buffer
map ,w :bw<CR>        "close current file buffer

"===========ctags setting
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags,/usr/include/tags,/usr/local/include/tags,
"========== ,/home/jhlim/git_local/myproject/kernel/kernel-3.4.39/tags,/home/jhlim/git_local/myproject/application/tags,/home/jhlim/stdlib.tags,/home/jhlim/git_local/myproject/prototype/tags

if version >= 500
func! Sts()
    let st = expand("<cword>")
    exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
    let st = expand("<cword>")
    exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>
endif

"===========cscope setting
set csprg=/usr/bin/cscope
set csto=0 
set cst 
set nocsverb
"cs add ~/../../BSP/kernel/kernel-3.4.39/cscope.out
"cs add /BSP/kernel/kernel-3.4.39/cscope.out
if filereadable("./cscope.out")       
	cs add cscope.out                 
    else                                  
	cs add ~/git_local/myproject/kernel/kernel-3.4.3/cscope.out
endif                                  
set csverb

func! Css()
    let css = expand("<cword>")
    new
    exe "cs find s ".css
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap ,css :call Css()<cr>

func! Csc()
    let csc = expand("<cword>")
    new
    exe "cs find c ".csc
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap ,csc :call Csc()<cr>

func! Csd()
    let csd = expand("<cword>")
    new
    exe "cs find d ".csd
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap ,csd :call Csd()<cr>

func! Csg()
    let csg = expand("<cword>")
    new
    exe "cs find g ".csg
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap ,csg :call Csg()<cr>

func! Cst()
    let csg = expand("<cword>")
    new
    exe "cs find t ".cst
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap ,cst :call Cst()<cr>

"===========man page setting
func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>

"================
let g:tagbar_type_snippets = {
  \ 'ctagstype' : 'snippets',
  \ 'kinds' : [
    \ 's:snippet'
  \ ]
  \ }
"================
command! Ctags execute '!/usr/bin/ctags -R .'

set nocompatible
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'taglist-plus'
Plugin 'jellybean.vim'
Plugin 'pboettch/vim-cmake-syntax'
call vundle#end()            " required

filetype plugin indent on    " required
