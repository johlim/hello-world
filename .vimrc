
"===========default setting
set cindent
set smartindent
set autoindent
set nowrap
set ff=unix
set bg=dark
set ruler
"specify folders to be searched
set path=/home/jhlim/nvs3320/application/library/include,/usr/include,/usr/local/include,/usr/src/include,/BSP/kernel/kernel-3.4.39
set nu

"===========key mapping
"folding
map <F1> v]}zf
"unfolding
map <F2> zo
"Taglist plugin
map <F3> :Tlist<cr><C-W><C-W>
map <F7> :NERDTree<cr><C-W><C-W>
"Buffer Explorer plugin
"map <F4> :BufExplorer<cr>
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
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags,/usr/include/tags,/usr/local/include/tags,/BSP/kernel/kernel-3.4.39/tags

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
set nocsverb
"cs add ~/../../BSP/kernel/kernel-3.4.39/cscope.out
cs add /BSP/kernel/kernel-3.4.39/cscope.out
cs add ./cscope.out
set csverb
set csto=0
set cst

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

"===========man page setting
func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>


set nocompatible
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'taglist-plus'

call vundle#end()            " required

filetype plugin indent on    " required
