" leader key
let mapleader = " "

" Plugins {{{
    call plug#begin('~/.vim/plugged')

    " Code {{{
        " autocomplete
        Plug 'Valloric/YouCompleteMe'
        Plug 'mattn/emmet-vim' " html css
        " brackets
        Plug 'tpope/vim-surround'
        " SQL uppercase
        Plug 'alcesleo/vim-uppercase-sql' " sql
        " multicursor
        Plug 'terryma/vim-multiple-cursors'
        " spelling
        Plug 'reedes/vim-wordy'
        " linter
        Plug 'w0rp/ale'
        Plug 'nvie/vim-flake8' " python
        Plug 'Quramy/tsuquyomi' " typescript
    " }}}

    " UI {{{
        " Project tree
        Plug 'scrooloose/nerdtree'
        " Theme
        Plug 'cocopon/iceberg.vim'
        " Git
        Plug 'tpope/vim-fugitive' " git
        " Status line
        Plug 'vim-airline/vim-airline'
        Plug 'edkolev/tmuxline.vim'
        " highlight
        Plug 'pangloss/vim-javascript' " javascript
        Plug 'maxmellon/vim-jsx-pretty' " jsx
        Plug 'mboughaba/i3config.vim', { 'for': 'i3config' } " i3
        Plug 'leafgarland/typescript-vim' " typescript
        Plug 'Quramy/vim-js-pretty-template'
        " search
        Plug 'easymotion/vim-easymotion'
        Plug 'haya14busa/incsearch.vim'
        Plug 'haya14busa/incsearch-easymotion.vim'
        " docs
        Plug 'heavenshell/vim-jsdoc' " javascript
    " }}}

    " Project {{{
        " fuzzy finder
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
    " }}}

    " Emacs plugin {{{
        Plug 'jpalardy/vim-slime'
    " }}}

    call plug#end()

    " Theme {{{
        set t_Co=256
        set background=dark
        colorscheme iceberg
    " }}}

    " Easy Align {{{
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    " }}}

    " NERDTree {{{
        nmap <leader>n :NERDTreeToggle<cr>
        autocmd StdinReadPre * let s:std_in=1
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        let g:NERDTreeDirArrowExpandable = '+'
        let g:NERDTreeDirArrowCollapsible = '-'
        let NERDTreeQuitOnOpen=1

        " NERDTress File highlighting
        function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
            exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='.  a:guifg
            exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
        endfunction

        call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
        call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
        call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
        call NERDTreeHighlightFile('ts', 'Red', 'none', '#ffa500', '#151515')

        let NERDTreeIgnore = ['__pycache__']
    " }}}

    " ALE {{{
        let g:ale_sign_error = '>'
        let g:ale_sign_warning = '>'
        let b:ale_fixers = ['prettier', 'eslint']
        let g:ale_fix_on_save = 1
        augroup FiletypeGroup
            autocmd!
            au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
        augroup END
        let b:ale_linter_aliases = ['css', 'javascript']
        let b:ale_linters = ['stylelint', 'eslint']

        nmap <leader>s :ALEGoToDefinition<cr>
        nmap <leader>S :ALEGoToDefinitionInTab<cr>
        nmap <leader>r :ALEFindReferences<cr>
    " }}}

    " FZF {{{
        command! -bang -nargs=* Ag call fzf#vim#grep('ag --nogroup --column --color ^', 1)
        nmap <leader>p :FZF<cr>
        nmap <leader>ag :Ag<cr>
    " }}}

    " Tmuxline {{{
        let g:tmuxline_preset = {
              \'a'    : '#(tmuxto current socket)',
              \'b'    : '#S',
              \'c'    : '#W',
              \'win'  : '#I #W',
              \'cwin' : '#I #W',
              \'x'    : '%a',
              \'y'    : '#W %R',
              \'z'    : '#H'}
    " }}}

    " REPL (vim-slime) {{{
        let g:slime_target = "tmux"
        let g:slime_paste_file = "$HOME/.slime_paste"
    " }}}

    " (search) easymotion {{{
        map <leader>f <Plug>(easymotion-overwin-f)
        map <leader>F <Plug>(easymotion-overwin-f2)
        map <leader>l <Plug>(easymotion-overwin-line)
        map <leader>/ <Plug>(incsearch-easymotion-/)
        map <leader>? <Plug>(incsearch-easymotion-?)
        map g/ <Plug>(incsearch-easymotion-stay)
    " }}}

    " Airline {{{
        let g:airline_powerline_fonts=1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#buffer_nr_show = 1
    " }}}

    " YCM {{{
        let g:ycm_show_diagnostics_ui = 0
    " }}}

    " Emmet {{{
        let g:user_emmet_leader_key='<C-y>'
    " }}}

    " Wordy (spelling) {{{
        let g:wordy#ring = [
          \ 'weak',
          \ ['being', 'passive-voice', ],
          \ 'business-jargon',
          \ 'weasel',
          \ 'puffery',
          \ ['problematic', 'redundant', ],
          \ ['colloquial', 'idiomatic', 'similies', ],
          \ 'art-jargon',
          \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
          \ 'adjectives',
          \ 'adverbs',
          \ ]
        nmap <leader>ww :Wordy problematic<cr>
        nmap <leader>wn :NoWordy<cr>
    " }}}

    " JS Docs {{{
        nmap <silent> <C-d> <Plug>(jsdoc)
        let g:jsdoc_input_description = 1
        let g:jsdoc_enable_es6 = 1
        let g:jsdoc_param_description_separator = 1
    " }}}

    " Vim JS pretty templates {{{
        autocmd FileType typescript JsPreTmpl
    " }}}
" }}}

" Common {{{
    syntax on
    filetype plugin indent on

    " diff
    set diffopt+=vertical
    :command DG diffget
    :command DP diffput

    " encoding
    set encoding=utf-8

    " python
    let python_highlight_all = 1

    " Transparency
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi SpecialKey guibg=NONE ctermbg=NONE
    hi ErrorMsg guibg=NONE ctermbg=NONE
    hi WarningMsg guibg=NONE ctermbg=NONE
    hi Error guibg=NONE ctermbg=NONE
    hi Todo guibg=NONE ctermbg=NONE

    " Clipboard
    set clipboard=unnamedplus

    " Swap files
    set noswapfile

    " Folding
    " set foldenable
    " set foldmethod=syntax

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
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    autocmd FileType html,css,typescript setlocal softtabstop=2 tabstop=2 shiftwidth=2
    set smartindent
    set autoindent
    map <F7> mzgg=G`z
    map <F8> :%s/[ ]\{1,\}$//g<cr>

    " Tabs
    nmap <c-t>n :tabnew<cr>
    nmap <c-t>q :tabclose<cr>
    nmap <c-t>Q :tabonly<cr>
    nmap <c-t>h :tabprevious<cr>
    nmap <c-t>k :tabprevious<cr>
    nmap <c-t>j :tabnext<cr>
    nmap <c-t>t :tabnext<cr>
    nmap <c-t><c-t> :tabnext<cr>
    nmap <c-t>l :tabnext<cr>
    nmap <c-t>t :tabnext<cr>

    " Windows
    nmap <c-h> :wincmd h<cr>
    nmap <c-j> :wincmd j<cr>
    nmap <c-k> :wincmd k<cr>
    nmap <c-l> :wincmd l<cr>

    " search
    set incsearch
    nmap <leader><leader> :noh<cr>

    " buffers
    command! BD %bd|e#
    nmap <F9> :buffers<cr>:buffer<space>
    nmap <F9><F9> :b#<cr>

    " realtime update
    command! Updatable set autoread | au CursorHold * checktime | call feedkeys("lh")

    " for zsh vi-mode
    set backspace=indent,eol,start

    " path
    set path=.,src,node_nodules

    " split
    set splitbelow
    set splitright

    " pressed keys
    set showcmd

    " brackets
    let g:vim_editor_brackets = ["()", "[]", "<>", "{}"]
    inoremap ( ()<left>
    inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<right>" : ")"
    inoremap [ []<left>
    inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<right>" : "]"
    inoremap <expr> >  strpart(getline('.'), col('.')-1, 1) == ">" ? "\<right>" : ">"
    inoremap { {}<left>
    inoremap {<cr> {<cr>}<esc>O
    inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<right>" : "}"
    inoremap <expr> <backspace> index(g:vim_editor_brackets, strpart(getline('.'), col('.')-2, 2)) > -1 ? "\<backspace>\<del>" : "\<backspace>"
" }}}
