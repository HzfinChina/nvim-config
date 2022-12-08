"======= vim 自身配置
    set noswapfile
    set nocompatible
    set mouse=a  "所有模式 set history=100
    set shell=/bin/zsh
    "自动补全
    set wildmode=longest,list
    "快捷键
    "外观
    set t_Co=256
    set number
    set cursorline "光标当前行高亮
    set wrap  "自动折行
    set laststatus =2 "是否显示状态栏
    set ruler "在状态栏显示光标的当前位置
    syntax on
    set showmode
    set showcmd
    set encoding=utf-8
    "折叠
    set foldmethod=indent
    set foldlevel=99
    "缩进
    set autoindent
    set tabstop=4 "一个tab显示出来是多少空格的宽度
    set softtabstop=4 "当编辑模式时按backspace 删除的空格数量"
    set shiftwidth=4 "每一级缩进的宽度"
    set expandtab  "自动将tab转化为空格
    "搜索
    set showmatch "高亮匹配括号
    set hlsearch
    set ignorecase
    set smartcase
    "编辑
    set backspace=indent,eol,start
    "indent    allow backspacing over autoindent
    "eol       allow backspacing over line breaks (join lines)
    "start     allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.
    "
    set completeopt=menu,menuone,noselect "" 有关cmp 的补全菜单设置
"========Key Map
    let mapleader=','
    nnoremap <silent> <C-h> :tabprevious<cr>
    nnoremap <silent> <C-l> :tabnext<cr>
    " buffer
    nnoremap <silent> <C-j> :bnext<cr>
    nnoremap <silent> <C-k> :bprevious<cr>
    nnoremap <M-j> <C-w>j
    nnoremap <M-k> <C-w>k
    nnoremap <M-h> <C-w>h
    nnoremap <M-l> <C-w>l
    nnoremap <M-J> <C-w><S-j>
    nnoremap <M-K> <C-w><S-k>
    nnoremap <M-H> <C-w><S-h>
    nnoremap <M-L> <C-w><S-l>

    nnoremap <A-left> <C-w><
    nnoremap <A-right> <C-w>>
    nnoremap <A-up> <C-w>+
    nnoremap <A-down> <C-w>-
    nnoremap <Del> :bd!<Cr>
    inoremap <S-CR> <esc>o

    inoremap ￥ $
    inoremap （ (
    inoremap ） )

    " 插件相关
    nnoremap <A-t> :NvimTreeToggle<cr>
    nnoremap <C-t> :lua require('FTerm').toggle()<cr>
    " 图片粘贴
    nnoremap <leader>p :call mdip#MarkdownClipboardImage()<CR>
    " telescope 快速搜索
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
    nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
    nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
    " knap 预览markdown,latex
    " F5 processes the document once, and refreshes the view "
    nnoremap <silent> <F5> :lua require("knap").process_once()<CR>
    " F6 closes the viewer application, and allows settings to be reset "
    nnoremap <silent> <F6> :lua require("knap").close_viewer()<CR>
    " F7 toggles the auto-processing on and off "
    nnoremap <silent> <F7> :lua require("knap").toggle_autopreviewing()<CR>
    " F8 invokes a SyncTeX forward search, or similar, where appropriate "
    nnoremap <silent> <F8> :lua require("knap").forward_jump()<CR>
    "文件相关
    autocmd FileType markdown vnoremap $ c$<c-r>"$<esc>
    "注释
    autocmd FileType c,cpp nnoremap ' I//
    autocmd FileType c,cpp vnoremap ' A/*<esc>gvoI/*
    autocmd FileType python nnoremap  ' I#
    autocmd FileType python vnoremap  ' A'''<esc>gvoI'''
    autocmd FileType vim nnoremap ' I"
    "大括号
    autocmd FileType c,cpp inoremap { {<cr>}<esc>O

    function CompileRun()
        exec "w" 
        if &filetype == 'c' 
            exec '! gcc -g % -o %<'
        elseif &filetype == 'cpp'
            exec '! g++ -g -std=c++11 % -o %<'
        elseif &filetype == 'python'
            exec '! python3 %'
        elseif &filetype == 'sh'
            exec "! zsh %"
        elseif &filetype == 'html'
            exec "! firefox %"
        elseif &filetype == 'markdown'
            exec "MarkdownPreview"
        endif   
    endfunc
    nnoremap <f5> :call CompileRun()<cr>
"=======================================
" 皮肤设置  先设置皮肤样式再让vim 应用皮肤
    let g:material_style = "oceanic"
    colorscheme material
"=========================
" Packer插件管理
    lua require('plugins')
    lua require('plugin-config/nvim-tree')
    lua require('plugin-config/FTerm')
    lua require('plugin-config/nvim-lsp-installer')
    lua require('plugin-config/lspconfig')
    lua require('plugin-config/ultisnips')
    lua require('plugin-config/nvim-cmp')
    lua require('plugin-config/markdown-preview')
    lua require('plugin-config/lualine')
    lua require('plugin-config/bufferline')
    lua require('plugin-config/nvim-autopairs')
    lua require('plugin-config/Comment')
    lua require('plugin-config/nvim-scrollview')
    lua require('plugin-config/telescope')
    lua require('plugin-config/whichkey')
    lua require('plugin-config/nvim-lilypond-suite')
    lua require('plugin-config/knap')
