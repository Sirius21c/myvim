"===============================================
" Description: my vimrc
"
"
" Author: Cici
"
"           工欲善其事必先利其器
"================================================


" vundle插件管理
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" vim配色方案：.vim/colors/
colorscheme despacio

" 开启语法高亮功能
syntax enable

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 搜索高亮
set hlsearch

"实时进行高亮查询
set incsearch

"高亮显示当前的匹配
set wildmenu

" 当前行高亮
set cursorline

"浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" 高亮显示对应的括号
set showmatch

" 对应括号高亮增强（分色）
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBrace

"高亮空白符
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/

" 显示行号
set number

"缩进对齐线配置
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

"打开状态栏标尺(在编辑过程中，在右下角显示光标位置的状态行)
set ruler

"总是显示状态栏(默认的值为1 无法显示)
set laststatus=2

"在状态栏上显示正在输入的命令，未完成的指令片段亦会显示出来
set showcmd

"设置在状态栏上显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" 命令行（在状态行）的高度，默认为1,这里是2
set cmdheight=2

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

"关闭vi兼容模式
set nocompatible

"设置编码
set fileencoding=utf-8
set encoding=utf-8

" 将Tab自动展开成为空格
set expandtab

" 设置Tab显示的宽度，Python建议设置成4"
set tabstop=4

" 这个量是每行的缩进深度，一般设置成和tabstop一样的宽度
set shiftwidth=4

" 如果只想在Python文件中将Tab展开成空格，就改换成下面这句
" autocmd FileType python set expandtab

" 智能缩进
set smartindent
" 自动缩进
set autoindent

"设置字体
"set guifont=Courier_New:h10:cANSI

"设置不自动拆行
set nowrap

"共享剪切板
set clipboard+=unnamed

"临时粘贴，解决缩进混乱的问题，进入paste模式
set pastetoggle=<F10>

"为了方便复制，用<F2>开启/关闭行号显示
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"显示垂直线
nnoremap <F4> :set cursorcolumn!<CR>

"窗口切换快捷键修改
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

"保证vim在reopen一个文件的时候定位到同一行
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 目录树配置
"自动打开
" autocmd vimenter * NERDTree
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter \* if !argc() | NERDTree | endif
" 关闭文件时同时关闭文件浏览器
" let NERDTreeQuitOnOpen = 1
nmap <F5> :NERDTreeToggle<CR>
" 只剩NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" markdown-preview
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
