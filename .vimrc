set nocompatible              " be iMproved, required
filetype off                  " required

" Plugin-Manager {
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    set rtp+=~/

    " let Vundle manage Vundle, required
    call vundle#begin()    
    Plugin 'VundleVim/Vundle.vim'
    " Plugins {
        " Align lines
        Plugin 'godlygeek/tabular'              " :Tabularize
        " Auto-completion
        Plugin 'SirVer/ultisnips'               " Insert snippets of code
        Plugin 'honza/vim-snippets'             " Snippet pack for ultisnips
        Plugin 'ncm2/ncm2'                      " Auto-complete with tab
        Plugin 'roxma/nvim-yarp'                " Required for ncm2
        Plugin 'ncm2/ncm2-ultisnips'            " ncm2 ultisnips integration
        Plugin 'gaalcaras/ncm-R'                " ncm2 R support
        " Pandoc
        Plugin 'vim-pandoc/vim-pandoc'          " Needed for knitr, etc.
        Plugin 'vim-pandoc/vim-pandoc-syntax'   " Better syntax for *.Rmd
        " Plugin 'vim-pandoc/vim-rmarkdown'       " Extended support for *.Rmd
        " R Support
        Plugin 'jalvesaq/Nvim-R'                " R integration
        Plugin 'lervag/vimtex'                  " LaTeX support for *.Rmd files
        " Vim Themes
        Plugin 'scrooloose/nerdtree'            " Directory tree
	    Plugin 'vim-airline/vim-airline'        " Nice looking status bar
	    Plugin 'vim-airline/vim-airline-themes' " Themes for airline
        Plugin 'rafi/awesome-vim-colorschemes'  " Themes for vim
    " }
    call vundle#end()
" }

" Formatting {
    " Text and editor colors
    filetype plugin indent on     " required
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
    colorscheme lucius
"    colorscheme minimalist
"    colorscheme rdark-terminal2
"    colorscheme space-vim-dark
"    colorscheme tender
"    colorscheme wombat256mod
    " Set maximum characters per column to 80
    set textwidth=80                  " Wrap text at 80 chars
    set columns=80
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
    set autoindent                    " Automatically indent code
    set smartindent                   " Indent reacts to filetype
    set splitright                    " All new vsplits open on the right
    set splitbelow                    " All new splits open below
" }

" Vim-Airline {
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'aurora'
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
    " nnoremap <C-J> <C-W><C-J>         " move down with Ctrl+J
    " nnoremap <C-K> <C-W><C-K>         " move up with Ctrl+K
    " nnoremap <C-L> <C-W><C-L>         " move right with Ctrl+L
    " nnoremap <C-H> <C-W><C-H>         " move left with Ctrl+H
" }

" Pandoc {
    let g:pandoc#modules#disabled = ["folding", "spell"]
    let g:pandoc#syntax#conceal#use = 0
" }
