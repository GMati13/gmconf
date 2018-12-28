" Global variables {{{
    " leader key
    let mapleader = " "
" }}}

" Plugins {{{
    call plug#begin('~/.vim/plugged')

    " Code {{{
        " autocomplete
        Plug 'jiangmiao/auto-pairs'
        Plug 'Valloric/YouCompleteMe'
        " multicursor
        Plug 'terryma/vim-multiple-cursors'
        " alignment
        Plug 'junegunn/vim-easy-align'
        " highlight
        Plug 'pangloss/vim-javascript'
        Plug 'maxmellon/vim-jsx-pretty'
        Plug 'leafgarland/typescript-vim'
    " }}}

    " UI {{{
        " Project tree
        Plug 'scrooloose/nerdtree'
        " Theme
        Plug 'cocopon/iceberg.vim'
        Plug 'morhetz/gruvbox'
        Plug 'ajh17/spacegray.vim'
        Plug 'wolf-dog/nighted.vim'
        " fuzzy finder
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        " linter
        Plug 'w0rp/ale'
        " Git
        Plug 'tpope/vim-fugitive'
    " }}}

    call plug#end()

    " Git {{{
        nnoremap <Leader>b :GitBlame<CR>
    " }}}

    " Theme {{{
        set t_Co=256
        colorscheme gruvbox
        "colorscheme iceberg
        "colorscheme spacegray
        "colorscheme nighted
        set background=dark
    " }}}

    " Easy Align {{{
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    " }}}

    " NERDTree {{{
        nmap <leader>n :NERDTreeToggle<CR>
        autocmd StdinReadPre * let s:std_in=1
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        let g:NERDTreeDirArrowExpandable = '+'
        let g:NERDTreeDirArrowCollapsible = '-'
        let NERDTreeQuitOnOpen=1
    " }}}

    " ALE {{{
        let g:ale_sign_error = '>'
        let g:ale_sign_warning = '>'
    " }}}

    " FZF {{{
        command! -bang -nargs=* Ag call fzf#vim#grep('ag --nogroup --column --color ^', 1)
        nmap <leader>p :FZF<CR>
        nmap <leader>ag :Ag<CR>
    " }}}
" }}}

" Common {{{
    " Clipboard
    set clipboard=unnamed

    " Swap files
    set noswapfile
    
    " Folding
    set foldenable
    set foldmethod=syntax

    " Numbers
    set number relativenumber
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
    set cursorline
    
    " Indent
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    autocmd FileType html,css setlocal shiftwidth=2 tabstop=2
    set smartindent
    set autoindent
    map <F7> mzgg=G`z

    " Tabs
    nmap <c-t>n :tabnew<CR>
    nmap <c-t>q :tabclose<CR>
    nmap <c-t>h :tabprevious<CR>
    nmap <c-t>j :tabnext<CR>
    nmap <c-t>k :tabprevious<CR>
    nmap <c-t>l :tabnext<CR>

    " search
    nmap <leader><leader> :noh<cr>

    " Drop buffers
    command! BD %bd|e#

    " realtime update
    command! Updatable set autoread | au CursorHold * checktime | call feedkeys("lh")
" }}}
