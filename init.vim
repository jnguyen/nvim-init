" Preamble {
    " Setting encoding ensures that powerline fonts will work
    set encoding=utf-8                        " Set encoding to UTF-8
" }

" Plug-Manager {
    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin
    call plug#begin(stdpath('data'))

    " Plugin list {
        " UltiSnips
        Plug 'SirVer/ultisnips'               " Insert snippets of code
        Plug 'honza/vim-snippets'             " Snippet pack for ultisnips
        " NCM2 - Neovim auto complete
        Plug 'ncm2/ncm2'                      " Auto-complete with tab
        Plug 'roxma/nvim-yarp'                " Required for ncm2
        Plug 'ncm2/ncm2-ultisnips'            " ncm2 ultisnips integration
        Plug 'gaalcaras/ncm-R'                " ncm2 R support
        Plug 'ncm2/ncm2-jedi'                 " ncm2 python support
        Plug 'ncm2/ncm2-bufword'              " Current buffer word completion
        Plug 'ncm2/ncm2-path'                 " Required for completions
        " Pandoc
        Plug 'vim-pandoc/vim-pandoc'          " Needed for knitr, etc.
        Plug 'vim-pandoc/vim-pandoc-syntax'   " Better syntax for *.Rmd
        " R Support
        Plug 'jalvesaq/Nvim-R'                " R integration
        " LaTeX support
        Plug 'lervag/vimtex'                  " LaTeX support for *.Rmd files
        " Vim colorstepper
        Plug 'qualiabyte/vim-colorstepper'
        " Vim Themes
        Plug 'scrooloose/nerdtree'            " Directory tree
	    Plug 'vim-airline/vim-airline'        " Nice looking status bar
	    Plug 'vim-airline/vim-airline-themes' " Themes for airline
        Plug 'rafi/awesome-vim-colorschemes'  " Themes for vim
    " }
    call plug#end()
" }

" Formatting {
    " Text and editor colors
    " filetype plugin indent on     " required | Plug auto does this
    syntax enable
    set number                      " Turn line numbers on
    set background=dark             " Assume background is dark
"    colorscheme OceanicNext        " Pick syntax color theme
"    colorscheme PaperColor
"    colorscheme deus
"    colorscheme dracula
"    colorscheme happy_hacking
"    colorscheme hybrid
"    colorscheme hybrid_material
"    colorscheme hybrid_reverse
"    colorscheme iceberg
"    colorscheme jellybeans
    colorscheme onehalfdark
"    colorscheme minimalist
"    colorscheme rdark-terminal2
"    colorscheme space-vim-dark
"    colorscheme tender
"    colorscheme wombat256mod
    " Set maximum characters per column to 80
    set textwidth=80                  " Wrap text at 80 chars
    " set columns=80                  " Set window size to 80 chars
    if exists('+colorcolumn')
      set colorcolumn=80
    else
      au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif
    " Tab settings
    set expandtab                     " Convert tabs to spaces
    set tabstop=4                     " Tabs at 4 characters long
    set softtabstop=4                 " Backspace tabs 4 chars at a time
    set shiftwidth=4                  " Indents are 4 chars
    " set autoindent                    " Automatically indent code
    set smartindent                   " Indent reacts to filetype
    set splitright                    " All new vsplits open on the right
    set splitbelow                    " All new splits open below
" }

" Vim-Airline {
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'onehalfdark'
" }

" nVim-R {
    " R output is highlighted with current colorscheme
    let g:rout_follow_colorscheme = 1
    " R commands in R output are highlighted
    let g:Rout_more_colors = 1
    " turn off _ to -> transformation
    let g:R_assign = 0
" }

" ncm2 {
    " enable ncm2 on all bufs
    autocmd BufEnter * call ncm2#enable_for_buffer() 
    set completeopt=noinsert,menuone,noselect             " required for ncm2
" }

" ncm2-ultisnips {
    " Press enter key to trigger snippet expansion
    " The parameters are the same as `:help feedkeys()`
    inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

    " c-j c-k for moving in snippet
    " let g:UltiSnipsExpandTrigger       = "<Plug>(ultisnips_expand)"
    let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
" }

" Keybindings {
    let mapleader="\\"
    nmap <leader>ne :NERDTree<cr>     " \\ne to open NerdTree
    nmap <leader>y :let @+=@0<cr>     " \y to move yank register to system clip
    nmap <leader>p "+p                " \p to paste from keyboard
    " nnoremap <C-J> <C-W><C-J>         " move down with Ctrl+J
    " nnoremap <C-K> <C-W><C-K>         " move up with Ctrl+K
    " nnoremap <C-L> <C-W><C-L>         " move right with Ctrl+L
    " nnoremap <C-H> <C-W><C-H>         " move left with Ctrl+H
" }

" Pandoc {
    " let g:pandoc#modules#disabled = ["folding", "spell"]
    " let g:pandoc#syntax#conceal#use = 0
" }
