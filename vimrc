"some base setting
set guifont=Monospace\ 9
set tags=./.tags;,.tags
set noshowmode
set number
syntax enable
syntax on
set history=1000
set nocompatible
filetype plugin indent on
set encoding=utf-8
set fileencodings=ucs-bom,utf-bom,utf-8,cp936,big5,gbk,utf16
set hidden
set showmatch
"search
set incsearch
set hlsearch
set ignorecase
set smartcase

set shiftwidth=4
set tabstop=4
set noexpandtab

set foldmethod=indent
"set smarttab

"c++缩进
set autoindent
set cindent
set smartindent
set cinoptions+=g0
set textwidth=120

set autochdir
set autowrite
set autoread
set winaltkeys=no

set nowrap

let mapleader = ","

"load plugin
"polyglot 要求放到加载之前
"postscr跟ps冲突
let g:polyglot_disable = ['postscr']

call plug#begin('~/.vim/plugged')
"common
	Plug 'sirver/ultisnips'
	Plug 'honza/vim-snippets'

	Plug 'ludovicchabant/vim-gutentags',{'for':['c','cpp','java']}
	Plug 'mhinz/vim-signify'
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-syntax'
	Plug 'kana/vim-textobj-function',{'for':['c','cpp','vim','java']}
	Plug 'sgur/vim-textobj-parameter'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	Plug 'vim-scripts/a.vim'
"	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"	Plug 'vim-latex/vim-latex',{'for':'tex'}
	Plug 'Shougo/echodoc.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'enricobacis/vim-airline-clock'
	Plug 'tpope/vim-surround'
	"语法高亮，包含了主流的语言的语法高亮
	Plug 'sheerun/vim-polyglot'
	Plug 'morhetz/gruvbox'
	Plug 'wadackel/vim-dogrun'
	"动态检查
	"Plug 'dense-analysis/ale'
	"括号补全
	Plug 'scrooloose/nerdcommenter'
	Plug 'luochen1990/rainbow'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-repeat'
	"代码对齐
	Plug 'godlygeek/tabular'
	Plug 'mattn/emmet-vim'
	" js支持
	Plug 'pangloss/vim-javascript'
	"python支持
	"python语法高亮
	Plug 'davidhalter/jedi-vim', {'for':'python'}
	Plug 'Vimjas/vim-python-pep8-indent'
	"latex
	Plug 'lervag/vimtex',{'for':'tex'}
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"glsl
	Plug 'tikhomirov/vim-glsl'
	Plug 'mildred/vim-bufmru'
	"git plugin
	Plug 'tpope/vim-fugitive'
	Plug 'hjc0720/qssvim'
	"vue
	"Plug 'posva/vim-vue'
	"Plug 'vim-syntastic/syntastic',{'for':'vue'}
	"Plug 'MaraniMatias/vue-formatter',{'for':'vue'}
	"md
	"Plug 'plasticboy/vim-markdown'
	"生成md 目录
	":GenTocMarked生成目录
	":UpdateToc更新目录
	"Plug 'mzlogin/vim-markdown-toc'
	" 打开/关闭预览
	":MarkdownPreviewToggel
	"Plug 'iamcco/markdown-preview.vim'
	"启动界面
	Plug 'mhinz/vim-startify'
	"go 语言支持
	Plug 'fatih/vim-go'
	"cmake
	Plug 'pboettch/vim-cmake-syntax'
	Plug 'cdelledonne/vim-cmake'
	"异步执行插件，内含工程根目录变量
	Plug 'skywind3000/asyncrun.vim'
	call plug#end()
" scrooloose/nerdcommenter 
"<leader>cc   加注释
"<leader>cu   解开注释
"<leader>c<space>  加上/解开注释, 智能判断
"<leader>cy   先复制, 再注解(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
"let g:NERDSpaceDelims=1
"rainbow
let g:rainbow_active = 1 
"vim-gutentags setting
let g:gutentags_project_root = ['.root','.svn','.git','.project']
let g:gutentags_ctags_tagfile='.tags'
"将自动生成的tags文件全部放入~/.cache/tags
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_cache_dir=s:vim_tags
"配置ctags的参数
let g:gutentags_ctags_extra_args=['--fields=+niazS','--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+pxst']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']
"let g:gutentags_trace = 1

if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

"vim-signify
set signcolumn=yes

"leaderF
let g:Lf_ShortcutF='<c-p>'
let g:Lf_ShortcutB='<m-n>'
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_DefaultMode='NameOnly'
noremap <c-n> :LeaderfMrc<cr>
if has('gui_running')
	noremap <m-m> :LeaderfFunction<cr>
	noremap <m-n> :LeaderfBuffer<cr>
	noremap <m-O> :LeaderfFile<cr>
	noremap <m-S> :LeaderfTag<cr>
else
	noremap <leader>m :LeaderfFunction<cr>
	noremap <leader>n :LeaderfBuffer<cr>
	noremap <leader>O :LeaderfFile<cr>
	noremap <leader>S :LeaderfTag<cr>
endif

let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_CachedDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0

"airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
set laststatus=2

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap <c-tab> :BufMRUNext<CR>
map <S-Tab> :BufMRUPrev<CR>

"cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"gruvbox
"set termguicolors
set background=dark
"let g:gruvbox_material_background='hard'

"set term=screen-256color
set t_Co=256
"set term=screen
"let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"self function 添加作者信息
function AddTitle()
    call append(0,"/********************************************************************************/")
    call append(1,"//作者       :	黄建超														    /")
    call append(2,"//create:	".strftime("%Y-%m-%d %H:%M"))
    call append(3,"//Last modified:	".strftime("%Y-%m-%d %H:%M"))
    call append(3,"//Filename     :	".expand("%:t"))
    call append(5,"/********************************************************************************/")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endf
 
function UpdateTitle()
     normal m'
     execute '/Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")  @'
     normal ''
     normal mk
     execute '/Filename/s@:.*$@\=":\t".expand("%:t")@'
     execute "noh"
     normal 'k
     echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction
function Title()
    let n = 1
    while n < 6
        let line = getline(n)
        if line =~ '^\s*\S*Last\smodified\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

nnoremap <leader>at :call Title()<CR>

"Plug 'godlygeek/tabular'
",a= 按=号对齐
",a:按：号对齐
",a,按,号对齐

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a<Space> :Tabularize /\S\+/<CR>

"mattn/emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_quickfix_mode=0
let conceallevel=1
let g:tex_conceal='abdmg'
"let g:vimtex_compiler_progname='nvr'
let g:vimtex_toc_config = {
\ 'name' : 'TOC',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\}
nnoremap <F3> :VimtexTocToggle<CR>
let maplocalleader=","

"UltiSnips
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
"let g:UltiSnipsSnippetDirectories=['UltiSnips', 'plugged/vim-snippets/UltiSnips']
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsUsePythonVersion=3
"a.vim
nnoremap <silent> <m-o> :A<CR>
nnoremap <Leader>o :A<CR>

"vue
let g:syntastic_javascript_checkers=['eslint']
"c++ lambda缩进不正确
autocmd FileType cpp setlocal cino+=g-1,j1,(0,ws,Ws,N+s,t0,g0,+0


packadd termdebug
let g:termdebug_wide = 80

function! BindDebugKey()
	nnoremap F9 :Break<CR>
	nnoremap F10 :Over<CR>
	nnoremap F11 :Step<CR>
	nnoremap F5 :Continue<CR>
endfunction

autocmd FileType c,cpp call BindDebugKey()
set nobackup

"coc.nvim
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

set shiftwidth=4
set tabstop=4

"glsl
"add vs ps as glsl
autocmd BufNewFile,BufRead *.vs,*.ps,*.gs set ft=glsl
autocmd BufNewFile,BufRead *.VS,*.PS,*.GS set ft=glsl

"vim-cmake
"
let g:cmake_jump_on_error = 0 " We do not want to focus the console

augroup vim-cmake-group
	autocmd User CMakeBuildFailed cfirst
	autocmd User CMakeBuildFailed CMakeClose
augroup END

augroup vim-cmake-group
	autocmd User CMakeBuildPre wa
augroup END

augroup vim-cmake-group
	autocmd User CMakeBuildSucceeded CMakeClose
augroup END

nmap <leader>mb <Plug>(CMakeBuild)
nmap <leader>ms <Plug>(CMakeSwitch)
nmap <leader>mq <Plug>(CMakeClose)
let cpunum = system("grep -c ^processor /proc/cpuinfo ")
let g:cmake_build_options= ['-j',str2nr(cpunum)]

"配合vim-cmake设置makeprg
function! ResetMakeprg()
	let l:root = asyncrun#get_root('%')
	let l:buildPath = ""

	"echo "l:root:" . l:root
	if !empty(l:root)
		let l:cmakeFile = findfile("CMakeLists.txt",l:root)
		"echo "l:cmakeFile:" . l:cmakeFile
		if !empty(l:cmakeFile)
			let l:buildDir = ["Debug","Release","Build","build"]
			for l:dir in l:buildDir
				let l:buildPath = finddir(l:dir, l:root)
				"echo "l:buildPath:" . l:buildPath
				if len(l:buildPath) > 0
					break
				endif	
			endfor
		endif
	endif
	let cpunum = system("grep -c ^processor /proc/cpuinfo ")
	"echo "cur build path:" . l:buildPath
	let &makeprg= 'make $* -C ' . l:buildPath . ' -j' . cpunum 
endfunction

autocmd FileType c,cpp call ResetMakeprg()
