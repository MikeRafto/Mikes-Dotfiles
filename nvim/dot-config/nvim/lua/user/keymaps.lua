---@diagnostic disable: undefined-global
local opts = {noremap = true, silent = true, buffer = bufnr}

local term_opts = {silent = true}

local keymap = vim.api.nvim_set_keymap

--leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader= " "
vim.g.mapcallleader = " "

--Tabs and Panes
keymap("n", "<leader>|", ":vsp<CR><C-l>", opts)
keymap("n", "<leader>\\", ":vsp<CR><C-l>", opts)
keymap("n", "<leader>-", ":sp<CR>", opts)
keymap("n", "<leader>_", ":sp<CR>", opts)
keymap("n", "<leader>t", ":tabedit<CR>", opts)
keymap("n", "<leader>,", ":vertical resize -10<CR>", opts)
keymap("n", "<leader>.", ":vertical resize +10<CR>", opts)
keymap("n", "<leader>[", ":horizontal resize -10<CR>", opts)
keymap("n", "<leader>]", ":horizontal resize +10<CR>", opts)

--Pane Navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

--NRW file explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

--LSP
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

--Quickfix
vim.keymap.set("n", "<leader>cn", ":cn<CR>")
vim.keymap.set("n", "<leader>cp", ":cp<CR>")
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")

-- Copy and Pasting to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>ya", [[:%y +<CR>]])

-- Select all text
keymap("n", "<leader>a", "ggVG", opts)

-- Center Screen to Cursor
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- Indent Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Marks
keymap("n", "<leader>m", ":marks<CR>", opts)

-- Buffers
keymap("n", "<leader>b", ":buffers<CR>:buffer<Space>", opts)
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
keymap("n", "<leader>bf", ":bfirst<CR>", opts)
keymap("n", "<leader>bl", ":blast<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)

-- IncRename
vim.keymap.set("n", "<leader>s", ":IncRename ")
vim.keymap.set("n", "<F2>", ":IncRename ")

-- Oil.nvim
vim.keymap.set("n", "<leader>o", ":Oil . --float<CR>")

-- Cheatsheet
keymap("n", "<leader>?", ":Cheatsheet<CR>", opts)

keymap("n", "<leader>md", ":RenderMarkdown toggle<CR>", opts)
