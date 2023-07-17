" Build off of vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Use vim settings rather than vi settings
if &compatible
    set nocompatible
endif

" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/space-vim-dark'
Plug 'liuchengxu/space-vim-theme'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'elkowar/yuck.vim'
call plug#end()

" Terminal name
set term=xterm-256color

" Colors
if exists('+termguicolors')
    set t_Co=256
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

syntax on
color space-vim-dark
let g:airline_theme='violet'

" Line numbers
set nu

" Indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Clipboard
xnoremap "+y y:callsystem("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g') <cr>p

" Unicode
if has("multi_byte")
    if &encoding !~? '^u'
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        set encoding=utf-8
    endif
    setglobal fileencoding=utf-8
    " Uncomment to have 'bomb on by default for new files.
    " Note, this will not apply to the first, empty buffer created at Vim
    " startup.
    setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif

" Vimwiki links
function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme. "
    let link = a:link
    if link =~# '^vfile:'
        let link = link[1:]
    else
        return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        exe 'tabnew ' . fnameescape(link_infos.filename)
        return 1
    endif
endfunction
