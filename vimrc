" .vimrc skrá Guðmundar Kára
" 
let g:Tex_DefaultTargetFormat='pdf'
" Prevents Vim 7.0 from setting filetype to 'plaintex'
" GKS latex STUFF
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_Env_wrapfigure = "\\begin{wrapfigure}{<+rl+>}{0.5\\textwidth}\<CR>\\begin{center}\<CR>\\includegraphics[width=0.48\\textwidth]{<+file+>}\<CR>\\end{center}\<CR>\\caption{<+caption texti+>}\<CR>\\label{fig:<+label+>}\<CR>\\end{wrapfigure}<++>"
let g:Tex_Env_subfigure = "\\begin{figure}[<+rHl+>] \<CR>\\centering \<CR>\\subfloat[<++>]{\\includegraphics[width=0.45\\textwidth]{<+file+>}} \<CR>\\subfloat[<++>]{\\includegraphics[width=0.45\\textwidth]{<+file+>}} \<CR>\\caption{\\footnotesize{<+caption texti+>}} \<CR>\\label{fig:<+label+>} \<CR>\\end{figure}<++>"
let g:Tex_Com_sum="\\sum_{<++>}^{<++>}<++>"
let g:Tex_Com_int="\\int_{<++>}^{<++>}<++>"
let g:Tex_Com_ttt="\\texttt{<++>}<++>"
let g:Tex_Com_foot="\\footnotesize{<++>}<++>"
let g:Tex_Com_ein="\\mathrm{<++>}<++>"
let g:Tex_Com_nucl="\\nucl{<+A+>}{<+P+>}{<+Name+>}<++>"
let g:Tex_Com_ma="\\mathrm{<++>}<++>"
let g:Tex_Com_circ="^{\\circ}\\unit{C}"
"

"--------NERDTREE------------
:command NT NERDTree
map <leader>n :NERDTreeToggle<CR>
:command SS set spell
"FILETYPES
:command TEX set filetype=tex
:command PY set filetype=python
:command XML set filetype=xml
"--------NERDTREE------------
map <F4> \ll
"Make bashaliases work from vim, useing !command
:set shellcmdflag=-ic

set number " show line numbers
set pastetoggle=<F3>
set cursorline
set cursorcolumn

set ruler		" show the cursor position all the time
set ignorecase		"Ignore case when searching.
set smartcase		"Ignore case unless it's uppercase.
set incsearch		"Use incremental search
set history=700
"set backup

set ofu=syntaxcomplete#Complete

filetype plugin on
filetype indent on
syntax enable

"--------COLORSCHEME------------
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"--------COLORSCHEME------------

set autoindent
nnoremap j gj
nnoremap k gk

"let loaded_matchparen = 1
"highlight Normal guifg=white guibg=black


set so=4
set wildmenu

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/dotfiles/vimrc

set backspace=eol,start,indent
set whichwrap+=<,>,h,l


set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
"set cursorcolumn
"set cursorline


map <F4> \ll

"Pathogen
execute pathogen#infect()


"From VimBits

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-h> :GundoToggle<CR>
noremap <C-k> <Esc>:Ack!

"Close Vim if NERDTree is the only window left
 au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

hi link EasyMotionTarget WarningMsg
hi link EasyMotionShade  Comment

function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunc


map <buffer> K :let save_isk = &iskeyword \|
    \ set iskeyword+=. \|
    \ execute "!pydoc " . expand("<cword>") \|
    \ let &iskeyword = save_isk<CR>

nnoremap <C-L> :call g:ToggleNuMode()<CR>

:nnoremap <F2> "=strftime("%c")<CR>P
