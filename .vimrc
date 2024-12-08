set nocompatible

filetype off
let mapleader=';'
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <leader>ss :%s/
inoremap jk <esc>
inoremap <c-}> <Plug>(copilot-prev)
inoremap <c-]> <Plug>(copilot-next)
imap <F5> <esc><F5>
inoremap <leader>a <esc>A
xnoremap <leader>; :Commentary<CR>
nnoremap <leader>; :Commentary<CR>
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
nnoremap <leader>/ :Ag<cr>

autocmd BufNewFile,BufRead *.html set filetype=html
autocmd FileType java inoremap <silent> <C-p> System.out.println();<Esc>hi
autocmd FileType typst let g:AutoPairs['$']='$'
autocmd FileType typst let g:AutoPairs['*']='*'
autocmd FileType typst nnoremap <F5> :w<CR>:silent!clear<CR>:silent!!echo "compiling..."<CR>:!typst compile % && evince %:r.pdf &<CR>
autocmd FileType markdown let g:AutoPairs['$']='$'
autocmd FileType markdown let g:AutoPairs['*']='*'
autocmd FileType markdown let g:AutoPairs['`']='`'

xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
nnoremap Q  gqap
nnoremap D dedb
nnoremap L $
nnoremap <leader>F :FZF<cr>
nnoremap <c-f> :Rg<cr>
nnoremap <c-x> <c-w>x
nnoremap <c-e> %
xnoremap L $
nnoremap J 5j
nnoremap K 5k
xnoremap J 5j
xnoremap K 5k
nnoremap H 0
xnoremap H 0
nnoremap <C-o> o<Esc>
inoremap <C-o> <Esc>o
inoremap <C-l> <Right>
inoremap <C-u> <esc>gUiwea
nnoremap <leader>k :FloatermKill<CR>



let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:tex_flavor = 'latex'
" 使用 Tab 键补全
" let g:AutoPairsMapCR = 0  " 禁用自动绑定 <CR> 键，手动管理
" inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : <C-R>=AutoPairsReturn()<CR>
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#refresh()
" inoremap <silent><expr> <M-j> pumvisible() ? "\<C-n>" : "\<M-j>"
" inoremap <silent><expr> <M-k> pumvisible() ? "\<C-p>" : "\<M-k>"

" 触发代码补全
" autocmd FileType * inoremap <silent><expr> <C-Space> coc#refresh()

" 映射 <leader>rn 为重命名变量快捷键
nmap <leader>R <Plug>(coc-rename)

set tagcase=match
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



""""""coc.nvim"""""""""
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
command! CopilotP vsplit | Copilot panel
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
imap <C-l> <Plug>(copilot-accept-word)
inoremap <silent><expr><c-k> coc#refresh()

let g:coc_global_extensions = ['coc-copilot']
let g:copilot_no_tab_map = v:true


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <down>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<down>" :
      \ coc#refresh()
inoremap <silent><expr> <up>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ CheckBackspace() ? "\<up>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm():
								\ "\<TAB>" 

" \ CheckBackspace() ? "\<Tab>" :

" \ coc#refresh()
" let g:AutoPairsMapCR = 0
" function! HandleCR()
"   if pumvisible()
"     " 如果补全菜单可见，选择当前补全项
"     return coc#pum#confirm()
"   else
"     " 如果补全菜单不可见，执行回车并处理自动配对
" 	execute '<C-R>=AutoPairsReturn()'
"   endif
" endfunction
" inoremap <buffer> <silent> <expr> <CR> HandleCR()
" imap <expr><CR> pumvisible() ? coc#pum#confirm() : "\<CR>\<Plug>AutoPairsReturn"
" inoremap <leader>l <c-r>=AutoPairsReturn()<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
" nmap <silent> <leader>d :CocDiagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> S :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" App the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions,
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



""""""""""""""""""""""""







set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kaarmu/typst.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'master'}
Plugin 'rakr/vim-one'
Plugin 'puremourning/vimspector'
Plugin 'github/copilot.vim'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'voldikss/vim-floaterm'
Plugin 'ilyachur/cmake4vim'
Plugin 'nixprime/cpsm'
Plugin 'liuchengxu/vim-which-key'
Plugin 'lervag/vimtex', { 'tag': 'v2.15' }
Plugin 'honza/vim-snippets'

"vimtex
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'

"snippets
let g:UltiSnipsExpandTrigger="<leader>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"CocInstall coc-json coc-tsserver coc-html coc-css coc-yaml coc-python coc-clangd coc-cmake coc-explorer coc-webview coc-snippets coc-markdown-preview-enhanced


nnoremap <silent> <leader>md :CocCommand markdown-preview-enhanced.openPreview<cr>




"let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" if has('nvim')
"   function! UpdateRemotePlugins(...)
"     " Needed to refresh runtime files
"     let &rtp=&rtp
"     UpdateRemotePlugins
"   endfunction

"   Plugin 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
" else
"   Plugin 'gelguy/wilder.nvim'

"   " To use Python remote plugin features in Vim, can be skipped
"   Plugin 'roxma/nvim-yarp'
"   Plugin 'roxma/vim-hug-neovim-rpc'
" endif

let g:vimspector_base_dir='/home/dascard/.vim/bundle/vimspector'

"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"packadd! vimspector
""nmap <F6> <Plug>VimspectorContinue


Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'weirongxu/coc-explorer'


"coc-explorer
nmap <F3> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
autocmd VimEnter * if !argc() | call timer_start(200, {-> execute('CocCommand explorer')}) | endif



"floaterm
nnoremap git :FloatermNew lazygit<CR>


"which-key

"let g:airline_theme='one'
autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s
" YouCompleteMe:语句补全插件
""set runtimepath+=~/.vim/bundle/YouCompleteMe
" 确保 YouCompleteMe 启用 Go 支持
" let g:ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_enable_semantic_highlighting=1
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
" let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
" let g:syntastic_ignore_files=[".*\.py$"]
" let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
" let g:ycm_complete_in_comments = 1
" let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
" let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             " 回车即选中当前项
" nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
" let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
"
 
 
 
" github 仓库中的插件 "
Plugin 'VundleVim/Vundle.vim'
 
 
"vim-airline配置:优化vim界面"
"let g:airline#extensions#tabline#enabled = 1
" airline设置
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
"let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1


" 映射切换buffer的键位
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


" vim-scripts 中的插件 "
Plugin 'taglist.vim'
"ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
map <F2> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=15
 
"Plugin 'The-NERD-tree'
""NERDTree 配置:F2快捷键显示当前目录树
"map <F1> :NERDTreeToggle<CR>
"let NERDTreeWinSize=25 
 
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
 
" 非 github 仓库的插件"
" Plugin 'git://git.wincent.com/command-t.git'
" 本地仓库的插件 "
 
call vundle#end()

"wilder


"autocmd CmdlineEnter * ++once call s:wilder_init() | call wilder#main#start()

" function! s:wilder_init() abort */
" Default keys
" call wilder#setup({
"       \ 'modes': [':', '/', '?'],
"       \ 'next_key': '<Tab>',
"       \ 'previous_key': '<S-Tab>',
"       \ 'accept_key': '<Down>',
"       \ 'reject_key': '<Up>',
"       \ })
" For Neovim or Vim with yarp
" For wild#cmdline_pipeline():
"   'language'   : set to 'python' to use python
"   'fuzzy'      : 0 - turns off fuzzy matching
"                : 1 - turns on fuzzy matching
"                : 2 - partial fuzzy matching (match does not have to begin with the same first letter)
" For wild#python_search_pipeline():
"   'pattern'    : can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
"   'sorter'     : omit to get results in the order they appear in the buffer
"   'engine'     : can be set to 're2' for performance, requires pyre2 to be installed
"                : see :h wilder#python_search() for more details
"
"
" call wilder#set_option('pipeline', [
"       \   wilder#branch(
"       \     wilder#cmdline_pipeline({
"       \       'language': 'python',
"       \       'fuzzy': 1,
"       \     }),
"       \     wilder#python_search_pipeline({
"       \       'pattern': wilder#python_fuzzy_pattern(),
"       \       'sorter': wilder#python_difflib_sorter(),
"       \       'engine': 're',
"       \     }),
"       \     wilder#python_file_finder_pipeline({
"       \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
"       \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
"       \       'filters': ['fuzzy_filter', 'difflib_sorter'],
"       \     }),
"       \     wilder#cmdline_pipeline(),
"       \     wilder#python_search_pipeline(),
"       \   ),
"       \ ])

" let s:highlighters = [
"         \ wilder#pcre2_highlighter(),
"         \ wilder#basic_highlighter(),
"         \ ]

" let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
"       \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
"       \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
"       \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
" let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
"       \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
"       \ )})

" let s:highlighters = [
"       \ wilder#pcre2_highlighter(),
"       \ wilder#basic_highlighter(),
"       \ ]

" let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
"       \ 'highlights': {
"       \   'gradient': s:gradient,
"       \ },
"       \ 'highlighter': wilder#highlighter_with_gradient(s:highlighters),
"       \ 'border': 'rounded',
"       \ 'max_height': '25%',
"       \ 'min_height': 0,
"       \ 'prompt_position': 'top',
"       \ 'reverse': 0,
"       \ 'left': [
"       \   ' ', wilder#popupmenu_devicons(),
"       \   wilder#popupmenu_buffer_flags({
"       \     'flags': ' a + ',
" 	  \     'icons': {'+': '', 'a': '', 'h': ''},
"       \   }),
"       \ ],
"       \ 'right': [
"       \   ' ', wilder#popupmenu_scrollbar(),
"       \ ],
"       \ }))

" let s:wildmenu_renderer = wilder#wildmenu_renderer({
"       \ 'highlighter': s:highlighters,
"       \ 'separator': ' · ',
"       \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
"       \ 'right': [' ', wilder#wildmenu_index()],
"       \ })

" call wilder#set_option('renderer', wilder#renderer_mux({
"       \ ':': s:popupmenu_renderer,
"       \ '/': s:wildmenu_renderer,
"       \ 'substitute': s:wildmenu_renderer,
"       \ }))

" endfunction
"which_key

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
map <leader>= gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y


" 设置当文件被改动时自动载入
set autoread
" quickfix模式
" 设置 makeprg 为使用 g++ 编译并生成与源文件同名的可执行文件
"autocmd FileType c,cpp set makeprg=g++\ -std=c++17\ -Wall\ -o\ output/%:r\ %

" 定义一个函数来编译并运行当前文件，并在运行后暂停
function! Compilec()
    " 保存当前文件
    write
    silent! execute '!printf "\033[H\033[2J"'
    let fullpath = expand('%:p:h')
    let output_path = fullpath . '/output/'
    "let output_path = substitute(fullpath, $HOME, '~', '') . '/output/'
    if !isdirectory(output_path)
		silent! call mkdir(output_path, 'p')
	endif
    " 编译当前文件
    
    let target_file = output_path . expand('%:t:r')
    let source_file = expand('%:p') " 获取当前源文件的完整路径
    let make_command = 'g++\ -std=c++17\ -Wall\ -o\ ' . target_file . '\ ' . source_file
    silent! execute 'set makeprg=' . make_command
    
    let pre_time = getftime(target_file)
    
    silent! execute 'make'
    "silent! execute '!printf "\033[H\033[2J"'
    
	"silent! botright split term://bash
    "silent! execute 'term ' . make_command
    "silent! execute '!printf "\033[H\033[2J"'

    " 构建目标路径
    
    let aft_time = getftime(target_file)


    " 如果编译成功，运行生成的可执行文件并暂停
    if aft_time > pre_time
        " 清屏并执行生成的可执行文件
        execute '!printf "Compile Successfully"'
        silent! execute '!printf "\033[H\033[2J"'
        execute '!' . target_file
    else
		silent! execute '!printf "\033[H\033[2J"'
		execute 'make'
        return
    endif
endfunction

function! CompileJ()
    let fullpath = expand('%:p:h')
    let output_dir = fullpath . '/output/'
    let cur_dir = getcwd()             " 保存当前工作目录

	"execute "!echo " . fullpath
	"execute "!echo " . output_dir
	"execute "!echo " . cur_dir



    if !isdirectory(output_dir)
        call mkdir(output_dir, 'p')
    endif
	silent! execute '!printf "\033[H\033[2J"'
	let file_name = expand('%:t:r')
    " 编译 Java 文件
    silent! execute "cd " . fullpath
    
    let target_file = output_dir . expand('%:t:r') . '.class'
    let pre_time = getftime(target_file)
    "execute "!pwd"
    
    
    "execute "!javac -d output " . expand('%:t')
    silent! execute "!javac -d output " . expand('%:t')
    "silent! execute "!javac -d " . output_dir . " " . fullpath
	
	let aft_time = getftime(target_file)
	
    " 运行编译后的 Java 类文件
    let class_file = fnamemodify(fullpath, ':t:r')  " 获取类名（不含路径和扩展名）
    
    let run_command = "cd output" . " && java " . file_name
    
    echo pre_time
    echo aft_time
    
    if aft_time > pre_time
		silent! execute '!printf "\033[H\033[2J"'
    	silent! execute "!echo " . expand('%:p')
		execute '!printf "Compile Successfully"'
		silent! execute '!printf "\033[H\033[2J"'
		silent! execute "!echo " . expand('%:p')
		execute "!".run_command
	else

		silent! execute '!printf "\033[H\033[2J"'
		silent! execute "!echo " . expand('%:p')
		execute "!javac -d output " . expand('%:t')
		execute "cd " . cur_dir
		return
	endif

    " 返回之前的工作目录
    execute "cd " . cur_dir
endfunction




" 设置编译和运行 JUnit 测试的快捷键（F6）

" 定义编译和运行测试的命令
command! -nargs=0 CompileAndRunTest :call CompileAndRunTest()

" 自定义函数来处理编译和运行

function! CompileAndRunTest()
  " Clear the screen
  silent! execute '!printf "\033[H\033[2J"'
  
  " Get directories
  let l:java_dir = expand('%:p:h')
  let l:cur_dir = getcwd()
  let l:output_dir = l:java_dir . '/output'
  
  " Get file names
  let l:base_name = expand('%:t:r') " Get the base name of the current file without extension
  let l:java_file = l:base_name . '.java'
  let l:test_file = l:base_name . 'Test.java'

  " Debug output for paths and filenames
  
  " Change to Java file's directory
  execute 'cd ' . l:java_dir
  
  " Verify if Java files exist
  if !filereadable(l:java_file)
    echo "Error: Java file " . l:java_file . " does not exist!"
    " Switch back to the original directory
    execute 'cd ' . l:cur_dir
    return
  endif
  
  if !filereadable(l:test_file)
    echo "Error: Test file " . l:test_file . " does not exist!"
    " Switch back to the original directory
    execute 'cd ' . l:cur_dir
    return
  endif

  " Create output directory and compile Java files
  let l:junit_dir = expand('~/junit')
  let l:compile_cmd = 'mkdir -p ' . l:output_dir . ' && javac -d ' . l:output_dir . ' -cp ' . l:junit_dir . '/junit-4.13.2.jar:' . l:junit_dir . '/hamcrest-core-1.3.jar:. ' . l:java_file . ' ' . l:test_file
  let l:compile_result = system(l:compile_cmd)

  " Check compilation result and show message
  if v:shell_error == 0
    echo "编译成功!"
  else
    echo "编译失败: " . l:compile_result
    " Switch back to the original directory
    execute 'cd ' . l:cur_dir
    return
  endif

  " Run tests
  let l:test_cmd = 'java -cp ' . l:output_dir . ':' . l:junit_dir . '/junit-4.13.2.jar:' . l:junit_dir . '/hamcrest-core-1.3.jar:. org.junit.runner.JUnitCore ' . l:base_name . 'Test'
  execute '!' . l:test_cmd

  " Switch back to the original directory
  execute 'cd ' . l:cur_dir
endfunction


" 将 F6 键映射为编译并运行测试
nnoremap <F6> :CompileAndRunTest<CR>

" 错误和警告处理
set makeprg=javac\ -d\ output\ -cp\ ~/junit/junit-4.13.2.jar:~/junit/hamcrest-core-1.3.jar:.
set errorformat=%A%f:%l:\ %m,%Z%p^,%C%\t%m



	

" 在按下 F6 时调用 CompileAndRun 函数
autocmd FileType c,cpp nnoremap <buffer> <F5> :call Compilec()<CR>
"autocmd FileType c,cpp nnoremap <buffer> <F5> :call Runc()<CR>
autocmd FileType java nnoremap <buffer> <F5> :call CompileJ()<CR>

autocmd FileType python nnoremap <F5> :w<cr>:!printf "\033[H\033[2J"<cr>:!python3 %<cr>
autocmd FileType python nnoremap <F6> :w<cr>:!printf "\033[H\033[2J"<cr>:!python3 -m ipdb %<cr>



"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on

"make 运行

"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 语法高亮
syntax on

" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
set fillchars=eob:\ ,vert:│
" 高亮显示普通txt文件（需要txt.vim脚本）
 au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
" autocmd FileType python inoremap { {}<esc>i
" autocmd FileType c,cpp,java :inoremap { {<CR>}<ESC>O
" :inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu







if has("gui_running")
	winpos 1280 100
	set termguicolors

	let g:tokyonight_style = 'night' " available: night, storm
	let g:tokyonight_enable_italic = 1

	colorscheme tokyonight
    set lines=35
    set columns=70
    "set guifont=Consolas:h24:cANSI:qDRAFT
    set guifont=JetBrainsMono\ Nerd\ Font\ 24
    " 设置背景图片
	"exec 'silent !feh --bg-scale ~/aft.jpeg'
else
	set termguicolors

	let g:tokyonight_style = 'night' " available: night, storm
	let g:tokyonight_enable_italic = 1
	let g:tokyonight_transparent_background = 1


	colorscheme tokyonight
	" autocmd ColorScheme tokyonight
	" 	\ highlight CopilotSuggestion guifg=#555555 ctermfg=8
	set background=dark

endif





