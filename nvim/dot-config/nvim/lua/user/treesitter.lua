-- note: this is ai generated

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html", "java", "gdscript", "json" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true, -- Takes care of vim.treesitter.start()
    additional_vim_regex_highlighting = false,
  },
  
  indent = {
      enable = true, 
  },
}

-- Enable folding (Native Neovim feature, but depends on Treesitter)
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
