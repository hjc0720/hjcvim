"some base setting
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
set incsearch
set hlsearch
set ignorecase
set smartcase
set nofoldenable

set autoindent
set shiftwidth=4
set tabstop=4
set smarttab

"load plugin

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin('~/.vim/plugged')
	Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
	Plug 'ludovicchabant/vim-gutentags',{'for':['c','cpp','java']}
	Plug 'mhinz/vim-signify'
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-syntax'
	Plug 'kana/vim-textobj-function',{'for':['c','cpp','vim','java']}
	Plug 'sgur/vim-textobj-parameter'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'Yggdroot/LeaderF'
	Plug 'vim-scripts/a.vim'
	Plug 'vimwiki/vimwiki'
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	Plug 'vim-latex/vim-latex',{'for':'tex'}
	Plug 'Shougo/echodoc.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'
	Plug 'sainnhe/gruvbox-material'
	Plug 'wadackel/vim-dogrun'
	Plug 'dense-analysis/ale'
	Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

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
let g:ycm_show_diagnostics_ui=0
let g:ycm_server_log_level='info'
let g:ycm_min_num_identifier_candiadate_chars=2
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion='<c-z>'
set completeopt=menu,menuone

"noremap <c-z> <NOP>
"leaderF
let g:Lf_ShortcutF='<c-p>'
let g:Lf_ShortcutB='<m-n>'
noremap <c-n> :LeaderfMrc<cr>
noremap <A-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>

let g:Lf_StlSeparator={'left':'','right':'','front':''}

let g:Lf_RootMarkers=['.project','.root','.git']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_CachedDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0
"let g:Lf_HideHelp=1
let g:Lf_StlColorscheme='powerline'
let g:Lf_PreviewResult={'Function':0,'BufTag':0}
noremap <a-m> :LeaderfTag<cr>

let g:ycm_semantic_triggers={
			\'c,cpp,python,java,go,perl':['re!\w{2}'],
			\'cs,lua,javascript':['re!\w{2}'],
			\}

"airline
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"gruvbox
"set termguicolors
set background=dark
let g:gruvbox_material_background='hard'

set term=screen-256color
"set t_Co=256
"set term=screen

colorscheme gruvbox-material

