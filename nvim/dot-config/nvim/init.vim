" :source $MYVIMRC to reload config

" ====== GENERAL SETTINGS ======
set noerrorbells 
set nohlsearch 
set scrolloff=8 
set autoindent 
set showmatch 
syntax on 
set laststatus=2 
set nocompatible 

" relative numbers
set number
set relativenumber

" fix tabs
set tabstop=4
set shiftwidth=4
" set softtabstop=44100
" set expandtab

" greek normal mode
let g:mapleader = " "
let g:maplocalleader = " "
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

" ====== IMPORTS ======
call plug#begin()
	" core
	Plug 'nvim-lua/plenary.nvim' "utilities for lua plugins
	Plug 'nvim-lua/popup.nvim' "used by telescope
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' } "fuzzy finder
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "syntax parsing
	Plug 'neovim/nvim-lspconfig' "for language-specific features
	Plug 'williamboman/mason.nvim' "installer for LSP servers
	Plug 'williamboman/mason-lspconfig.nvim' "connects mason installs to lspconfig

	" vIbE cODiNg
	Plug 'ThePrimeagen/99' "The AI client that Neovim deserves, built by those that still enjoy to code.

	" autocompletion
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'

	" editor features
	Plug 'windwp/nvim-autopairs' "auto-insert matching parentheses, quotes, etc.
	Plug 'numToStr/Comment.nvim' "auto-comment with gc and gcc
	Plug 'mg979/vim-visual-multi', {'branch': 'master'} "multiple cursors
	Plug 'smjonas/inc-rename.nvim' "LSP-enhanced renaming
	Plug 'lewis6991/gitsigns.nvim' "git diff signs

	" UI/UX enchancement
	Plug 'nvim-lualine/lualine.nvim' "statusline
	Plug 'nvim-tree/nvim-web-devicons' "icons
	Plug 'folke/noice.nvim' "replaces the ui for cmdline, messages and popupmenu
	Plug 'MunifTanjim/nui.nvim' "ui components used by noice
	Plug 'rcarriga/nvim-notify' "popup notification ui replacement fot vim.notify
	Plug 'tribela/vim-transparent' "enables transparent background
	Plug 'sudormrfbin/cheatsheet.nvim' "cheatsheet
	"Plug 'vimpostor/vim-tpipeline' "embed vim statusline in the tmux statusline
	Plug 'Wansmer/langmapper.nvim' "for greek keymaps
	Plug 'stevearc/oil.nvim' "buffer-focused file explorer

	" language-specific
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
	Plug 'lervag/vimtex' "For LaTeX
	Plug 'habamax/vim-godot' "For GDscript
	Plug 'mfussenegger/nvim-jdtls' "Java LSP (Uses Eclipse JDT Language Server)

	" themes
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'EdenEast/nightfox.nvim'
	Plug 'morhetz/gruvbox'
	Plug 'shaunsingh/nord.nvim'
	Plug 'catppuccin/nvim', {'as': 'catppuccin'} "options: catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
	Plug 'neanias/everforest-nvim', { 'branch': 'main' }
call plug#end()

" ====== CONFIGURE PLUGINS ======
" disable copilot by default
let g:copilot_enabled = 0
let g:vimtex_quickfix_open_on_warning = 0

" ====== STYLING ======
set termguicolors

" transparent background settings (this needs to apply after the theme)
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight FloatBorder guibg=none ctermbg=none
highlight NormalFloat guibg=none ctermbg=none

" some custom colors
" highlight LineNr guifg=#535576
set cursorline

" ====== LUA CONFIGS ======
" load lua configs
lua <<EOF
require "user.lsp"
require "user.cmp"
require "user.keymaps"
require "user.telescope"
require "user.cheatsheet"
require "user.treesitter"
require "user.langmapper"
require "user.alacritty_colorscheme"
require "user.lualine"
require "user.99"
require("inc_rename").setup()
require("oil").setup({ float = { border = "rounded", max_width = 60, max_height = 15 } })
EOF
