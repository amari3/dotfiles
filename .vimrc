" use visual bell instead of beeping
set vb

" incremental search
set incsearch

" syntax highlighting
set bg=light
syntax on

" autoindent
autocmd FileType perl set autoindent|set smartindent

" 4 space tabs
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

" show matching brackets
autocmd FileType perl set showmatch

" show line numbers
autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>


" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

