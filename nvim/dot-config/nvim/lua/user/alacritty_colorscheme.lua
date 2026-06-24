local theme_map = {
  everforest_dark = "everforest",
  everforest_light = "everforest",
  tokyonight_night = "tokyonight",
  tokyonight_storm = "tokyonight",
  tokyonight_day = "tokyonight",
  ayu_mirage = "ayu",
}

local last_alacritty_mtime = -1

local function get_alacritty_theme(config_path)
  local file = io.open(config_path, "r")
  if not file then return nil end
  
  local content = file:read("*a")
  file:close()
  
  local imports_block = content:match('import%s*=%s*%[([^%]]+)%]')
  if imports_block then
    local theme = nil
    for path in imports_block:gmatch('"([^"]+)"') do
      local t = path:match(".*/([^/]+)%.toml$")
      if t then theme = t end
    end
    return theme
  end
  return nil
end

local function apply_alacritty_theme(force)
  local config_path = vim.fn.expand("~/.config/alacritty/alacritty.toml")
  local current_mtime = vim.fn.getftime(config_path)

  if current_mtime == -1 then return end -- File not found

  -- The ultimate fix: only do work if alacritty.toml was actually modified!
  if not force and current_mtime == last_alacritty_mtime then
    return
  end
  last_alacritty_mtime = current_mtime

  local alacritty_theme = get_alacritty_theme(config_path)
  if alacritty_theme then
    local nvim_theme = theme_map[alacritty_theme] or alacritty_theme

    local available_themes = vim.fn.getcompletion(nvim_theme, "color")
    local theme_exists = false
    for _, t in ipairs(available_themes) do
      if t == nvim_theme then theme_exists = true break end
    end

    if theme_exists then
      -- Apply the theme
      pcall(vim.cmd, "colorscheme " .. nvim_theme)

      -- Re-apply transparency overrides from init.vim that are cleared by colorscheme
      vim.cmd([[
        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
        highlight FloatBorder guibg=none ctermbg=none
        highlight NormalFloat guibg=none ctermbg=none
      ]])

      -- Lualine will automatically update itself via the ColorScheme autocmd in lualine.lua
    end
  end
end

-- 1. Apply immediately on startup
apply_alacritty_theme(true)

-- 2. Check for theme updates whenever Neovim regains focus 
vim.api.nvim_create_autocmd({"FocusGained"}, {
  group = vim.api.nvim_create_augroup("sync_alacritty_theme", { clear = true }),
  callback = function() apply_alacritty_theme(false) end,
})
