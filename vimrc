"some base setting
set guifont=Monospace\ 8
set tags=./.tags;,.tags
set noshowmode
set number
syntax enable
syntax on
set history=1000
set nocompatible
filetype plugin indent on
set encoding=utf-8
set fileencodings=ucs-bom,utf-bom,utf-8,cp936,big5,gbk
set hidden
set showmatch
"search
set incsearch
set hlsearch
set ignorecase
set smartcase

set nofoldenable

set shiftwidth=4
set tabstop=4
set smarttab

"c++缩进
set autoindent
set cindent
set smartindent
set cinoptions+=g0
set textwidth=120

set autochdir
set winaltkeys=no

set nowrap

let mapleader = ","

"load plugin

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

call plug#begin('~/.vim/plugged')
"common
	Plug 'sirver/ultisnips'
	Plug 'honza/vim-snippets'

	Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
	Plug 'ludovicchabant/vim-gutentags',{'for':['c','cpp','java']}
	Plug 'mhinz/vim-signify'
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-syntax'
	Plug 'kana/vim-textobj-function',{'for':['c','cpp','vim','java']}
	Plug 'sgur/vim-textobj-parameter'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
	Plug 'vim-scripts/a.vim'
	Plug 'vimwiki/vimwiki'
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	Plug 'vim-latex/vim-latex',{'for':'tex'}
	Plug 'Shougo/echodoc.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'enricobacis/vim-airline-clock'
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'
	Plug 'sainnhe/gruvbox-material'
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
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins','for':'python'}
	Plug 'Vimjas/vim-python-pep8-indent'
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"latex
	Plug 'lervag/vimtex'
	"glsl
	Plug 'tikhomirov/vim-glsl'
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

"ycm
let g:ycm_add_preview_to_completeopt=0
"let g:ycm_show_diagnostics_ui=0
let g:ycm_server_log_level='info'
let g:ycm_min_num_identifier_candiadate_chars=2
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_key_invoke_completion='<C-k>'
let g:ycm_confirm_extra_conf = 0
set completeopt=menu,menuone
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_semantic_triggers={
			\'c,cpp,python,java,go,perl':['re!\w{2}'],
			\'cs,lua,javascript':['re!\w{2}'],
			\}

"noremap <c-z> <NOP>
"leaderF
let g:Lf_ShortcutF='<c-p>'
let g:Lf_ShortcutB='<m-n>'
noremap <c-n> :LeaderfMrc<cr>
noremap <m-m> :LeaderfFunction<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-O> :LeaderfFile<cr>

let g:Lf_StlSeparator={'left':'','right':'','front':''}

let g:Lf_RootMarkers=['.project','.root','.git']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_CachedDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0
"let g:Lf_HideHelp=1
let g:Lf_StlColorscheme='powerline'
let g:Lf_PreviewResult={'Function':0,'BufTag':0}
noremap <Leader>S :LeaderfTag<cr>


"airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
set laststatus=2

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"ale
"let g:ale_lint_on_text_changed='normal'
"let g:ale_lint_on_insert_leave=1
"let g_airline#externsion#ale#enabled=1
"let g:ale_cpp_gcc_options='-Wall -O2 -std=c++17'
"nmap <Leader>s :ALEToggle<CR>
"let g:ale linters = {
	"\ 'python': ['flake8', 'pylint'],
	"\}

"let g:ale_fixers = {
			"\ 'python': [ 'yapf' ],
			"\}
"rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"gruvbox
"set termguicolors
set background=dark
let g:gruvbox_material_background='hard'

"set term=screen-256color
set t_Co=256
"set term=screen

colorscheme gruvbox-material

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

if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a, :Tabularize /,<CR>
	vmap <Leader>a, :Tabularize /,<CR>
endif

"mattn/emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let conceallevel=1
let g:tex_conceal='abdmg'
"UltiSnips
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
"let g:UltiSnipsSnippetDirectories=['UltiSnips', 'plugged/vim-snippets/UltiSnips']
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsUsePythonVersion=3
"a.vim
nnoremap <silent> <m-o> :A<CR>
"glsl
"add vs ps as glsl
autocmd! BufNewFile,BufRead *.vs,*.ps,*.gs set ft=glsl
