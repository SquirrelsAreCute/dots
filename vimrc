set nocompatible              " be iMproved, required
set encoding=utf8

" -------------------------
" ------ Plugins
" -------------------------
filetype plugin indent on    " required
let g:tex_flavor = "latex"

" map leader
let mapleader=","

" managing plugins with minpac
packadd minpac
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('scrooloose/nerdtree')
call minpac#add('vimwiki/vimwiki')
call minpac#add('suan/vim-instant-markdown')
" call minpac#add('SirVer/ultisnips')
" call minpac#add('honza/vim-snippets')
call minpac#add('vim-airline/vim-airline')
call minpac#add('Valloric/YouCompleteMe')

call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('scrooloose/syntastic', {'type': 'opt'})
call minpac#add('k-takata/minpac', {'type': 'opt'})

command! PackUpdate call minpac#update()
command! CleanUpdate call minpac#clean()

" fzf-mappings
nnoremap <C-p> :<C-u>FZF<CR>

" youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" nerdtree mappings
nnoremap <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" comment type in vim-commentar
autocmd FileType latex setlocal commentstring=%%\ %s
autocmd FileType matlab setlocal commentstring=%\ %s

" vim instant markdown
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 0
let g:instant_markdown_allow_unsafe_content = 0
let g:instant_markdown_allow_external_content = 1
nnoremap <leader>md :InstantMarkdownPreview<CR>

" vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" ultisnips plugin
let g:UltiSnipsSnippetsDir="/home/vincent/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["/home/vincent/.vim/ultisnips", "coolsnippets"]
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Marvim plugin
" Add figure macro
let @f='o\begin{figure}[h!]
			\\centering
			\\includegraphics[width=0.5\textwidth]{./figures/}
			\\caption{}
			\\label{}
			\\end{figure}3k$i'

" Add equation
let @e='o\begin{equation}
			\\label{Eq:}
			\\end{equation}k$'
"Add matrix
let @m='i\begin{bmatrix} \end{bmatrix}F '

" Add itemize
let @i='o\begin{itemize}
			\\item
			\\end{itemize}kA '
" Start latex doc
let @l='i\documentclass[paper=a4, fontsize=11pt]{scrartcl}
			\\usepackage[T1]{fontenc}
			\\usepackage{fourier}
			\\usepackage[english]{babel}
			\\usepackage{amsmath,amsfonts,amsthm}
			\\usepackage{graphicx}
			\\usepackage{mdwlist}
			\\usepackage{caption}
			\\usepackage{subcaption}
			\\usepackage{enumitem}
			\\usepackage{mathtools}
			\\usepackage{fancyhdr}
			\\pagestyle{fancyplain}
			\\fancyhead{}
			\\fancyfoot[L]{}
			\\fancyfoot[C]{}
			\\fancyfoot[R]{\thepage}
			\\renewcommand{\headrulewidth}{0pt}
			\\renewcommand{\footrulewidth}{0pt}
			\\setlength{\headheight}{13.6pt}
			\\numberwithin{equation}{section}
			\\numberwithin{figure}{section}
			\\numberwithin{table}{section}
			\\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{12}
			\\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{12}
			\\def\prog#1{{\tt #1}}
			\\date{\normalsize \today}
			\\title{}
			\\begin{document}
			\\maketitle
			\\end{document}4k$i'

" Add frame (presentation mode)
let @p='o%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			\\begin{frame}{}
			\\end{frame}k$i'
" add brackets
let @b='A {}O'
" Help Macro
let @h='oHelp Macro: - @f --> insert figure- @e --> insert equation- @i --> insert itemize- @l --> start latex doc- @p --> insert frame'

" ----------------------------------

" ctags
nnoremap <f7> :!ctags -R<CR>
set tags+=tags

" folding
augroup folding_method
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" augroup remember_folds
" 	autocmd!
" 	autocmd BufWinLeave * mkview
" 	autocmd BufWinEnter * silent! loadview
" augroup END

" indentation
nnoremap <F8> mzgg=G`z

" nvim mapping
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-v><Esc> <Esc>
	" highlight! link TermCursor Cursor
	" highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" ------------------------------
" ------- Status Line
" ------------------------------
set cmdheight=1     " command line height
set showmode        " show mode in status line
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" ------------------------------
" ------- Theme (Colors)
" ------------------------------
syntax on
set background=dark
set guicursor=a:blinkon0
highligh LineNr ctermfg=grey


" semicolon enters ex mode
nnoremap ; :
nnoremap : ;

" Move around splits with <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabprev<CR>
nnoremap tj :tabnext<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" buffers
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
nnoremap <leader>T :enew<cr>
" Move to the next buffer
nnoremap <leader>k :bnext<CR>
" Move to the previous buffer
nnoremap <leader>j :bprevious<CR>
" Close the current buffer and move to the previous one
nnoremap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

" space bar un-highligts search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set spelllang=en_us   " set spelling lang
set number          " line numbering
set relativenumber 

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" wrap'n'jump by display lines
set wrap
set linebreak
set display+=lastline

" --------------------------
" ------- Searching & History
" --------------------------
set hlsearch          " highlight all search results
set incsearch         " increment search
set smartcase         " uppercase causes case-sensitive search
set wrapscan          " searches wrap back to the top of file

set history=200        " keep 50 lines of command line history

" --------------------------
" -------- Space & Indent
" --------------------------
set noexpandtab
set tabstop=4        " set tab keys to 2 spaces
set shiftwidth=4
set smartindent
set noautoindent     " set noautoindent to prevent vim from
" inserting unwanted indents when pasting backspace
set bs=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set modeline
set modelines=5

" map keys to toggle functions
function! MapToggle(key, opt)
	let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
	exec 'nnoremap '.a:key.' '.cmd
	exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)

" keys & functions
MapToggle <F5> spell
MapToggle <F4> paste
MapToggle <F6> hlsearch

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
				\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" automatically give executable permissions if file begins with #! and contains '/bin/' in the path
function ModeChange()
	if getline(1) =~ "^#!"
		if getline(1) =~ "/bin/"
			silent !chmod a+x <afile> 
		endif
	endif
endfunction
au BufWritePost * call ModeChange()

" RemoveFancyCharacters COMMAND
function! RemoveFancyCharacters()
	let typo = {}
	let typo["“"] = '"'
	let typo["”"] = '"'
	let typo["‘"] = "'"
	let typo["’"] = "'"
	let typo["–"] = '--'
	let typo["—"] = '---'
	let typo["…"] = '...'
	:exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

" improves redrawing for newer computers
set tf
set nolazyredraw        " turn off lazy redraw
set wildmenu
set clipboard=unnamed   " yank and copy to X clipboard
" vim: set ts=4 sw=4 tw=0 noet :
