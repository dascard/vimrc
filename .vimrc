" ==============================================================================
" DASCARD'S VIMRC CONFIGURATION
" ==============================================================================
" Author: dascard
" Email: dascard601@gmail.com
" Description: A well-organized Vim configuration optimized for development
" ==============================================================================

" ------------------------------------------------------------------------------
" 基础设置 (Basic Settings)
" ------------------------------------------------------------------------------
set nocompatible
filetype off

" Leader 键设置
let mapleader=';'

" 基本设置
set encoding=utf-8
set number
set relativenumber
set smarttab
set smartcase
set clipboard=unnamed,unnamedplus
set ignorecase
set splitright
set mouse=a
set softtabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set showmatch
set matchtime=1
set updatetime=300
set signcolumn=yes
set autoread
set autowrite

" ------------------------------------------------------------------------------
" 窗口导航快捷键 (Window Navigation)
" ------------------------------------------------------------------------------
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <c-x> <c-w>x

" ------------------------------------------------------------------------------
" 编辑快捷键 (Editing Shortcuts)
" ------------------------------------------------------------------------------
inoremap jk <esc>
inoremap <leader>a <esc>A
nnoremap <leader>ss :%s/
xnoremap <leader>; :Commentary<CR>
nnoremap <leader>; :Commentary<CR>
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

" 移动行
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" 缩进
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" 快速导航
nnoremap Q  gqap
nnoremap D dedb
nnoremap L $
nnoremap J 5j
nnoremap K 5k
xnoremap J 5j
xnoremap K 5k
nnoremap H 0
xnoremap L $
xnoremap H 0
nnoremap <M-o> o<Esc>
inoremap <C-l> <Right>
inoremap <C-u> <esc>gUiwea
nnoremap <C-s> :w!<cr>
nnoremap <c-e> %

" 搜索快捷键
nnoremap <c-f> :Rg<cr>
nnoremap <leader>F :FZF<cr>

" ------------------------------------------------------------------------------
" 文件类型设置 (File Type Settings)  
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.html set filetype=html
autocmd FileType java inoremap <silent> <C-p> System.out.println();<Esc>hi
autocmd FileType typst let g:AutoPairs['$']='$'
autocmd FileType typst let g:AutoPairs['*']='*'
autocmd FileType markdown let g:AutoPairs['$']='$'
autocmd FileType markdown let g:AutoPairs['*']='*'
autocmd FileType markdown let g:AutoPairs['`']='`'

" ------------------------------------------------------------------------------
" 插件管理 (Plugin Management) - Vundle
" ------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 核心插件
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" 语言支持
Plugin 'kaarmu/typst.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'master'}
Plugin 'lervag/vimtex', { 'tag': 'v2.15' }
Plugin 'sheerun/vim-polyglot'

" 代码补全和智能
Plugin 'github/copilot.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" 界面美化
Plugin 'rakr/vim-one'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'frazrepo/vim-rainbow'
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/vim-cursorword'

" 功能增强
Plugin 'voldikss/vim-floaterm'
Plugin 'puremourning/vimspector'
Plugin 'liuchengxu/vim-which-key'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'weirongxu/coc-explorer'
Plugin 'mhinz/vim-startify'
Plugin 'psliwka/vim-smoothie'
Plugin 'preservim/tagbar'

" 异步任务系统
Plugin 'skywind3000/asyncrun.vim'
Plugin 'skywind3000/asynctasks.vim'

" 构建工具
Plugin 'ilyachur/cmake4vim'

call vundle#end()

" ------------------------------------------------------------------------------
" 异步任务配置 (AsyncTasks Configuration)
" ------------------------------------------------------------------------------
let g:asyncrun_open = 10
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asyncrun_save = 2
let g:asynctasks_term_pos = 'floaterm'

" 任务快捷键映射
noremap <silent><F5> :AsyncTask file-build-run<cr>
noremap <silent><F6> :AsyncTask file-build<cr>
noremap <silent><F7> :AsyncTask file-run<cr>

" 为不同文件类型设置任务
autocmd FileType typst nnoremap <F5> :AsyncTask typst-compile<CR>
autocmd FileType python nnoremap <F5> :AsyncTask file-run<CR>

" ------------------------------------------------------------------------------
" Floaterm 配置 (Floaterm Configuration)
" ------------------------------------------------------------------------------
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_autoclose = 1
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
nnoremap <leader>k :FloatermKill<CR>
nnoremap git :FloatermNew lazygit<CR>

" ------------------------------------------------------------------------------
" COC.NVIM 配置 (COC.NVIM Configuration)
" ------------------------------------------------------------------------------
" 全局扩展
let g:coc_global_extensions = ['coc-copilot']

" 基本设置
set nobackup
set nowritebackup
set tagcase=match

" 补全设置
inoremap <silent><expr><c-k> coc#refresh()
inoremap <silent><expr> <down>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<down>" :
      \ coc#refresh()
inoremap <silent><expr> <up>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ CheckBackspace() ? "\<up>" :
      \ coc#refresh()
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>" 

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 触发补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 诊断导航
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 代码导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 显示文档
nnoremap <silent> S :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 高亮当前符号
autocmd CursorHold * silent call CocActionAsync('highlight')

" 代码格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" 代码操作
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)

" 重构操作
nmap <leader>R <Plug>(coc-rename)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" 代码操作
nmap <leader>cl  <Plug>(coc-codelens-action)

" 文本对象
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" 选择范围
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" 命令
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" 状态栏集成
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CocList 映射
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <space>t  :<C-u>CocList tasks<cr>

" COC Explorer
nmap <F3> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
autocmd VimEnter * if !argc() | call timer_start(200, {-> execute('CocCommand explorer')}) | endif

" Markdown 预览
nnoremap <silent> <leader>md :CocCommand markdown-preview-enhanced.openPreview<cr>

" ------------------------------------------------------------------------------
" Copilot 配置 (Copilot Configuration)
" ------------------------------------------------------------------------------
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
imap <C-l> <Plug>(copilot-accept-word)
inoremap <c-}> <Plug>(copilot-prev)
inoremap <c-]> <Plug>(copilot-next)
command! CopilotP vsplit | Copilot panel

" ------------------------------------------------------------------------------
" 其他插件配置 (Other Plugin Configurations)
" ------------------------------------------------------------------------------

" UltiSnips 配置
let g:UltiSnipsExpandTrigger="<C-;>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Smoothie 配置
let g:smoothie_speed = 10
let g:smoothie_experimental_mappings = 1
nnoremap <unique> n <cmd>call smoothie#do('n')<CR>
nnoremap <unique> N <cmd>call smoothie#do('N')<CR>
nnoremap <unique> <C-o> <cmd>call smoothie#do("\<C-o>")<CR>

" Startify 配置
let g:startify_bookmarks = [
	\ {'v': '~/.vimrc'},
	\]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_files_number = 10
let g:startify_skiplist = [
  \ '^/tmp', 
  \ '.vim/plugged/.*/doc',
  \]

let g:art_words = [
			\[
			\'▀████▀                              ▀███                ', 
			\'  ██                                  ██                ', 
			\'  ██     ▀███  ▀███   ▄██▀██▄ ▄██▀███ ██  ▄██▀▀██▀   ▀██▀',
			\'  ██       ██    ██  ██▀   ▀████   ▀▀ ██ ▄█     ██   ▄█ ', 
			\'  ██     ▄ ██    ██  ██     ██▀█████▄ ██▄██      ██ ▄█   ',
			\'  ██    ▄█ ██    ██  ██▄   ▄███▄   ██ ██ ▀██▄     ███    ',
			\'██████████ ▀████▀███▄ ▀█████▀ ██████▀████▄ ██▄▄   ▄█     ',
			\'                                                ▄█       ',
			\'                                              ██▀        ',
			\],                                                        
			\[
			\' __                                  __				',			
			\'|  \                                |  \				',
			\'| ▓▓      __    __  ______   _______| ▓▓   __ __    __  ',
			\'| ▓▓     |  \  |  \/      \ /       \ ▓▓  /  \  \  |  \ ',
			\'| ▓▓     | ▓▓  | ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓▓ ▓▓_/  ▓▓ ▓▓  | ▓▓',
			\'| ▓▓     | ▓▓  | ▓▓ ▓▓  | ▓▓\▓▓    \| ▓▓   ▓▓| ▓▓  | ▓▓',
			\'| ▓▓_____| ▓▓__/ ▓▓ ▓▓__/ ▓▓_\▓▓▓▓▓▓\ ▓▓▓▓▓▓\| ▓▓__/ ▓▓',
			\'| ▓▓     \\▓▓    ▓▓\▓▓    ▓▓       ▓▓ ▓▓  \▓▓\\▓▓    ▓▓',
			\' \▓▓▓▓▓▓▓▓ \▓▓▓▓▓▓  \▓▓▓▓▓▓ \▓▓▓▓▓▓▓ \▓▓   \▓▓_\▓▓▓▓▓▓▓',
			\'                                             |  \__| ▓▓',
			\'                                              \▓▓    ▓▓',
			\'                                               \▓▓▓▓▓▓ ',
			\],
			\[
			\'██╗     ██╗   ██╗ ██████╗ ███████╗██╗  ██╗██╗   ██╗',
			\'██║     ██║   ██║██╔═══██╗██╔════╝██║ ██╔╝╚██╗ ██╔╝',
			\'██║     ██║   ██║██║   ██║███████╗█████╔╝  ╚████╔╝ ',
			\'██║     ██║   ██║██║   ██║╚════██║██╔═██╗   ╚██╔╝  ',
			\'███████╗╚██████╔╝╚██████╔╝███████║██║  ██╗   ██║   ',
			\'╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ',
			\]
			\]

function! GetRandomArtWord()
  let art_words = g:art_words
  let len = len(art_words)
  let random_index = float2nr(rand()) % len
  return art_words[random_index]
endfunction

let g:startify_custom_header = GetRandomArtWord()

" 其他插件配置
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

let g:rainbow_active = 1

" VimTeX 配置
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
let g:tex_flavor = 'latex'

" Tagbar 配置
map <F2> :TagbarToggle<CR>
let g:tagbar_width=25

" ------------------------------------------------------------------------------
" Vimspector 调试器配置 (Vimspector Debugger Configuration)
" ------------------------------------------------------------------------------
let g:vimspector_base_dir='/home/dascard/.vim/bundle/vimspector'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:vimspector_sidebar_width = 25
let g:vimspector_bottombar_height = 8 
let g:vimspector_terminal_minwidth = 50

" 调试快捷键
nmap <silent> <F10> <Plug>VimspectorContinue
nnoremap <silent> <leader>bp <Plug>VimspectorToggleBreakpoint
nnoremap <silent> <leader>rt <Plug>VimspectorRestart
nnoremap <silent> <space><space> <Plug>VimspectorStepOver
nnoremap <silent> <leader>si <Plug>VimspectorStepInto
nnoremap <silent> <leader>so <Plug>VimspectorStepOut
nnoremap <silent> <leader>tc <Plug>VimspectorRunToCursor
nnoremap <silent> <leader>e :call vimspector#Reset( { 'interactive': v:false } )<CR>

" ------------------------------------------------------------------------------
" Which-Key 配置 (Which-Key Configuration)
" ------------------------------------------------------------------------------
let g:which_key_map = {
            \ ';' : {
            \   'w' : ['<leader>w', 'close current tab'],
			\   '1' : ['<leader>1', 'switch to tab 1'],
			\   '2' : ['<leader>2', 'switch to tab 2'],
			\   '3' : ['<leader>3', 'switch to tab 3'],
			\   '4' : ['<leader>4', 'switch to tab 4'],
			\   '5' : ['<leader>5', 'switch to tab 5'],
			\   '6' : ['<leader>6', 'switch to tab 6'],
			\   '7' : ['<leader>7', 'switch to tab 7'],
			\   '8' : ['<leader>8', 'switch to tab 8'],
			\   '9' : ['<leader>9', 'switch to tab 9'],
			\   'qf': ['<leader>qf', 'fix current diagnostics'],
			\   'f' : ['<leader>f', 'format'],
			\   'R' : ['<leader>R', 'rename variable'],
            \   ';' : ['<leader>;', 'Comment Line'],
            \   'a' : ['<leader>a', 'append to end of line'],
            \   'ss': ['<leader>ss', 'search and replace'],
            \   '[' : ['<leader>[', 'previous buffer'],
            \   ']' : ['<leader>]', 'next buffer'],
            \   'F' : ['<leader>F', 'fuzzy file finder'],
            \   'ft': ['<leader>ft', 'new terminal'],
            \   'k' : ['<leader>k', 'kill terminal'],
            \   'md': ['<leader>md', 'markdown preview'],
            \   'bp': ['<leader>bp', 'toggle breakpoint'],
            \   'rt': ['<leader>rt', 'restart debugger'],
            \   'si': ['<leader>si', 'step into'],
            \   'so': ['<leader>so', 'step out'],
            \   'tc': ['<leader>tc', 'run to cursor'],
            \   'e' : ['<leader>e', 'exit debugger'],
            \   '=' : ['<leader>=', 'format file'],
            \ },
            \ ' ' : {
            \   'a' : ['<space>a', 'show all diagnostics'],
            \   'e' : ['<space>e', 'show all coc-extensions'],
            \   'c' : ['<space>c', 'show all commands'],
            \   'o' : ['<space>o', 'show outline'],
            \   's' : ['<space>s', 'show symbols'],
            \   'j' : ['<space>j', 'next item'],
            \   'k' : ['<space>k', 'prev item'],
            \   'p' : ['<space>p', 'resume list'],
            \   't' : ['<space>t', 'show tasks'],
            \   ' ' : ['<space><space>', 'debugger step over'],
            \ },
            \ '[' : {
            \   'g' : ['[g', 'go to prev diagnostics'],
            \ },
            \ ']' : {
            \   'g' : [']g', 'go to next diagnostics'],
            \ },
            \ 'g' : {
			\   'd' : ['gd', 'go to definition'],
            \   'i' : ['gi', 'go to implementation'],
            \   'r' : ['gr', 'go to reference'],
            \   'y' : ['gy', 'go to type definition'],
            \ }
\ }

" 注册 which-key
call which_key#register('<leader>', "g:which_key_map", 'v')
call which_key#register(' ', "g:which_key_map", 'v')
call which_key#register('[', "g:which_key_map", 'v')
call which_key#register(']', "g:which_key_map", 'v')

" which-key 快捷键映射
nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
nnoremap <silent> <space> :WhichKey '<space>'<CR>
nnoremap <silent> [ :WhichKey '['<CR>
nnoremap <silent> ] :WhichKey ']'<CR>
nnoremap <leader><space> :WhichKeyVisual ' '<CR>
set timeoutlen=500

" ------------------------------------------------------------------------------
" Airline 状态栏配置 (Airline Statusbar Configuration)
" ------------------------------------------------------------------------------
set t_Co=256
set laststatus=2

" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符  
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer 快捷键映射
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>w :bd<CR>

" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s


 


let g:which_key_map = {
            \ ';' : {
            \   'w' : ['<leader>w', 'close current tab'],
			\   '1' : ['<leader>1', 'switch to tab 1'],
			\   '2' : ['<leader>2', 'switch to tab 2'],
			\   '3' : ['<leader>3', 'switch to tab 3'],
			\   '4' : ['<leader>4', 'switch to tab 4'],
			\   '5' : ['<leader>5', 'switch to tab 5'],
			\   '6' : ['<leader>6', 'switch to tab 6'],
			\   '7' : ['<leader>7', 'switch to tab 7'],
			\   '8' : ['<leader>8', 'switch to tab 8'],
			\   '9' : ['<leader>9', 'switch to tab 9'],
			\   'qf': ['<leader>qf', 'fix current diagnostics'],
			\   'f' : ['<leader>f', 'format'],
			\   'R' : ['<leader>R', 'rename variable'],
            \   ';' : ['<leader>;', 'Comment Line'],
            \   'a' : ['<leader>a', 'append to end of line'],
            \   'ss': ['<leader>ss', 'search and replace'],
            \   '[' : ['<leader>[', '{}'],
            \   '/' : ['<c-f>', 'find text'],
            \ },
            \ ' ' : {
            \   'a' : ['<space>a', 'show all diagnostics'],
            \   'e' : ['<space>e', 'show all coc-extensions'],
            \ },
            \ '[' : {
            \   'g' : ['[g', 'go to prev diagnostics'],
            \ },
            \ ']' : {
            \   'g' : [']g', 'go to next diagnostics'],
            \ },
            \ 'g' : {
			\   'd' : ['gd', 'go to definition'],
            \   'i' : ['gi', 'go to implementation'],
            \   'r' : ['gr', 'go to reference'],
            \   'y' : ['gy', 'go to type definition'],
            \ }
\ }

call which_key#register('<leader>', "g:which_key_map", 'v')
call which_key#register(' ', "g:which_key_map", 'v')
call which_key#register('[', "g:which_key_map", 'v')
call which_key#register(']', "g:which_key_map", 'v')
" call which_key#register('g', "g:which_key_map", 'v')


nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
nnoremap <silent> <space> :WhichKey '<space>'<CR>
nnoremap <silent> [ :WhichKey '['<CR>
nnoremap <silent> ] :WhichKey ']'<CR>
" nnoremap <silent> g :WhichKey 'g'<CR>
nnoremap <leader><space> :WhichKeyVisual ' '<CR>
set timeoutlen=500

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: dascard") 
		call append(line(".")+2, "# mail: dascard601@gmail.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/zsh")
		call append(line(".")+6, "PATH=/home/dascard/bin:/home/dascard/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
		call append(line(".")+7, "export PATH")
		call append(line(".")+8, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: dascard") 
		call append(line(".")+2, "	> Mail: dascard601@gmail.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
    	call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 



nnoremap <C-s> :w!<cr>
" nnoremap <leader>f :find
inoremap <C-z> <Esc>ui
" 映射全选+复制 ctrl+a
map <C-A> ggVG
map! <C-A> <Esc>ggVG
map <leader>= :CocCommand prettier.formatFile<CR>
" map <leader>= gg=G
"" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y


" 设置当文件被改动时自动载入
set autoread
" quickfix模式
" 设置 makeprg 为使用 g++ 编译并生成与源文件同名的可执行文件
"autocmd FileType c,cpp set makeprg=g++\ -std=c++17\ -Wall\ -o\ output/%:r\ %

" ===============================================================================
" Legacy Compilation Functions - Replaced with AsyncTasks
" These functions have been replaced with AsyncTasks configuration in tasks.ini
" ===============================================================================
" NOTE: 旧的编译函数已被 AsyncTasks 替代，相关配置在 tasks.ini 文件中
" Old Compilec() and CompileJ() functions have been replaced with AsyncTasks



" ===============================================================================
" JUnit Test Configuration - Legacy (Replace with AsyncTasks)
" ===============================================================================
" NOTE: 这些 JUnit 测试配置建议迁移到 AsyncTasks 配置文件 tasks.ini 中
" Legacy JUnit configuration - recommend moving to AsyncTasks in tasks.ini



" ===============================================================================
" Legacy File Type Mappings - Replaced with AsyncTasks
" ===============================================================================
" NOTE: 这些按键映射已被 AsyncTasks 替代，使用 F5-F8 键进行统一的构建和运行
" Old F5 mappings replaced with AsyncTasks - use F5-F8 for unified build/run


" ===============================================================================
" Vim Basic Settings - Part 2 | Vim 基础设置 - 第二部分
" ===============================================================================

" Code completion | 代码补全设置
set completeopt=preview,menu
set completeopt=longest,menu

" File type detection | 文件类型检测
filetype plugin on
filetype plugin indent on

" Auto save and ruler | 自动保存和标尺
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术

" GUI settings | GUI 设置
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

" Folding configuration | 折叠配置
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠

" Error handling | 错误处理
set noeb                    " 去掉输入错误的提示声音
set confirm                 " 在处理未保存或只读文件的时候，弹出确认

" Indentation settings | 缩进设置
set autoindent
set cindent
set smartindent
set tabstop=4               " Tab键的宽度
set softtabstop=4           " 统一缩进为4
set shiftwidth=4
set noexpandtab             " 不要用空格代替制表符
set smarttab                " 在行和段开始处使用制表符

" File backup and swap | 文件备份和交换
set nobackup                " 禁止生成临时文件
set noswapfile

" Search settings | 搜索设置
set ignorecase              " 搜索忽略大小写
set smartcase               " 智能大小写搜索
set hlsearch                " 搜索逐字符高亮
set incsearch               " 增量搜索
set gdefault                " 行内替换
set wrapscan                " 搜索到文件两端时重新搜索

" Encoding and language | 编码和语言设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn

" Status line configuration | 状态栏配置
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2            " 总是显示状态行
set cmdheight=2             " 命令行高度

" File type settings | 文件类型设置
filetype on                 " 侦测文件类型
filetype plugin on          " 载入文件类型插件
filetype indent on          " 为特定文件类型载入相关缩进文件

" Advanced settings | 高级设置
set viminfo+=!              " 保存全局变量
set viminfo+=h              " 保存搜索历史的高亮状态
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set linespace=0             " 字符间插入的像素行数目
set wildmenu                " 增强模式中的命令行自动完成操作
set wildmode=longest:full,full " 命令行补全模式：最长匹配+完整菜单
set wildchar=<Tab>          " 设置通配符
set wildignorecase          " 命令行补全忽略大小写
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l      " 允许backspace和光标键跨越行边界

" Mouse settings | 鼠标设置
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" Window and display | 窗口和显示设置
set report=0                " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
set fillchars=eob:\ ,vert:│
set showmatch               " 高亮显示匹配的括号
set matchtime=1             " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3             " 光标移动到buffer的顶部和底部时保持3行距离

" Auto file type for text files | 文本文件自动类型
au BufRead,BufNewFile *  setfiletype txt







" ===============================================================================
" GUI and Theme Configuration | GUI 和主题配置
" ===============================================================================

" Enable syntax highlighting | 启用语法高亮
syntax on

" GUI-specific settings | GUI 特定设置
if has("gui_running")
    " Window positioning and size | 窗口位置和大小
    winpos 1280 100
    set lines=35
    set columns=70
    
    " Font configuration | 字体配置
    set guifont=JetBrainsMono\ Nerd\ Font\ 24
    
    " Terminal colors and theme | 终端颜色和主题
    set termguicolors
    let g:tokyonight_style = 'night'
    let g:tokyonight_enable_italic = 1
    colorscheme tokyonight
    
    " Optional background image (commented out)
    " exec 'silent !feh --bg-scale ~/aft.jpeg'
else
    " Terminal-specific settings | 终端特定设置
    set termguicolors
    set background=dark
    
    " Tokyo Night theme configuration | Tokyo Night 主题配置
    let g:tokyonight_style = 'night'
    let g:tokyonight_enable_italic = 1
    let g:tokyonight_transparent_background = 1
    
    colorscheme tokyonight
    
    " Optional Copilot suggestion colors (commented out)
    " autocmd ColorScheme tokyonight
    "     \ highlight CopilotSuggestion guifg=#555555 ctermfg=8
endif



" ===============================================================================
" ===============================================================================
" Search Completion Configuration | 搜索补全配置
" ===============================================================================
" SearchComplete.vim - 为搜索模式提供Tab补全功能
" Author: Chris Russell
" Description: Tab completion in search mode for pattern completion
" ===============================================================================

" Avoid multiple sourcing | 避免重复加载
if exists("loaded_search_complete")
    finish
endif
let loaded_search_complete = 1

" Key mappings | 按键映射
noremap / :call SearchCompleteStart()<CR>/

" Search complete start function | 搜索补全启动函数
function! SearchCompleteStart()
    cnoremap <Tab> <C-C>:call SearchComplete()<CR>/<C-R>s
    cnoremap <silent> <CR> <CR>:call SearchCompleteStop()<CR>
    cnoremap <silent> <Esc> <C-C>:call SearchCompleteStop()<CR>
endfunction

" Tab completion in search | 搜索中的Tab补全
function! SearchComplete()
    " Get current cursor position | 获取当前光标位置
    let l:loc = col(".") - 1
    " Get partial search and delete | 获取部分搜索内容并删除
    let l:search = histget('/', -1)
    call histdel('/', -1)
    
    " Check if new search | 检查是否为新搜索
    if l:search == @s
        " Get root search string | 获取根搜索字符串
        let l:search = b:searchcomplete
        " Increase number of autocompletes | 增加自动补全数量
        let b:searchcompletedepth = b:searchcompletedepth . "\<C-N>"
    else
        " One autocomplete | 一次自动补全
        let b:searchcompletedepth = "\<C-N>"
    endif
    
    " Store original search parameter | 存储原始搜索参数
    let b:searchcomplete = l:search
    " Set paste option to disable indent options | 设置粘贴选项以禁用缩进选项
    let l:paste = &paste
    setlocal paste
    
    " On a temporary line put search string and use autocomplete | 在临时行上放置搜索字符串并使用自动补全
    execute "normal! A\n" . l:search . b:searchcompletedepth
    " Get autocomplete result | 获取自动补全结果
    let @s = getline(line("."))
    " Undo and return to first char | 撤销并返回到第一个字符
    execute "normal! u0"
    " Return to cursor position | 返回到光标位置
    if l:loc > 0
        execute "normal! ". l:loc . "l"
    endif
    " Reset paste option | 重置粘贴选项
    let &paste = l:paste
endfunction

" Remove search complete mappings | 移除搜索补全映射
function! SearchCompleteStop()
    cunmap <Tab>
    cunmap <CR>
    cunmap <Esc>
endfunction

" ===============================================================================
" Auto Completion Settings | 自动补全设置
" ===============================================================================

" Bracket auto completion | 括号自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

" Auto completion helper function | 自动补全辅助函数
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" Commented alternative bracket completion for specific file types
" autocmd FileType python inoremap { {}<esc>i
" autocmd FileType c,cpp,java :inoremap { {<CR>}<ESC>O
" :inoremap } <c-r>=ClosePair('}')<CR>

" ===============================================================================
" End of Configuration | 配置文件结束
" ===============================================================================
" Author: dascard
" Email: dascard601@gmail.com
" Last Updated: 2025-05-29
" 
" For more information, see README.md
" 更多信息请参阅 README.md 文件
" ===============================================================================


