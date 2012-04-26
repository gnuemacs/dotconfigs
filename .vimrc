syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set nu
"incremental search
set incsearch
"highlight matches
set hlsearch
set ignorecase
set smartcase

filetype indent on "indent depends on filetype

set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

set laststatus=2
highlight Statusline ctermfg=black ctermbg=cyan
set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
set rulerformat=%15(%c%V\ %p%%%)
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}

function! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext 
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  return msg 
endfunction

function! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endfunction
