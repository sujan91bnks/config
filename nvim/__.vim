call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'Mofiqul/vscode.nvim'
Plug 'stevearc/oil.nvim'
Plug 'pocco81/auto-save.nvim'
Plug 'Chiel92/vim-autoformat'
Plug 'folke/trouble.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'williamboman/mason.nvim'  
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'MunifTanjim/nui.nvim'
Plug 'kawre/leetcode.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp'
call plug#end()

" General settings
set mouse=a
syntax on
set number
set noswapfile
set hidden
set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=utf8
set history=5000
set clipboard=unnamedplus
nnoremap dd "_dd


" Colorscheme
let g:vscode_style = 'dark'
colorscheme vscode
" .vimrc
"let g:auto_save_silent = 1  " do not display the auto-save notification
"let g:auto_save = 1  " do not display the auto-save notification
" .vimrc
"let g:auto_save_events=["InsertLeave", "TextChangedI"]
" Lua configuration for oil.nvim

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "html" }
})
require('oil').setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
    }
})
require('telescope').setup({
})
require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    highlight = {
        enable = true
    }
})
require('leetcode').setup({
    lang = "python"
})
EOF
nnoremap <C-e> :Oil<CR>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
