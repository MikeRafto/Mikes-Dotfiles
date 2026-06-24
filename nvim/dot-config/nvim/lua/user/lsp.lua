require("mason").setup()
vim.lsp.config('rust_analyzer', {})
vim.lsp.config('sourcekit', {})
vim.lsp.config('clangd', {})
-- vim.lsp.config('java_language_server', {})
vim.lsp.config('pyright', {})
vim.lsp.config('pyre', {})
vim.lsp.config('ts_ls', {})         
vim.lsp.config('cssls', {})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('html', { capabilities = capabilities })
vim.lsp.config('lua_ls', {})
-- vim.lsp.config('millet', {})
vim.lsp.config('sqlls', {})
vim.lsp.config('bashls', {})
vim.lsp.config('vimls', {})
vim.lsp.config('golangci_lint_ls', {})
vim.lsp.config('gopls', {})
vim.lsp.config('jdtls', {})
vim.lsp.config('biome', {})
vim.lsp.config('gdscript', { filetypes = { "gd", "gdscript", "gdscript3" } })
vim.lsp.config('qmlls', { 
	capabilities = capabilities,
	cmd = { "qmlls", "-I", "/usr/lib64/qt6/qml" }
})
vim.lsp.config('texlab', { capabilities = capabilities })

for _, s in ipairs({
  'rust_analyzer','sourcekit','clangd','pyright','pyre','ts_ls','cssls',
  'html','lua_ls','sqlls','bashls','vimls','golangci_lint_ls',
  'gopls','jdtls','biome','gdscript', 'qmlls', 'texlab'
}) do
  pcall(vim.lsp.enable, s)
end
