local en = [[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]]
local el = [[ΑΒΨΔΕΦΓΗΙΞΚΛΜΝΟΠQΡΣΤΘΩWΧΥΖαβψδεφγηιξκλμνοπqρστθωςχυζ]]

-- Setup the native Neovim langmap (Required by the plugin!)
local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

vim.opt.langmap = vim.fn.join({
    escape(el) .. ';' .. escape(en),
}, ',')

-- Setup the plugin
require('langmapper').setup({
  hack_keymap = true,
  default_layout = en,
  layouts = {
    greek = {
      id = 'el',
      default_layout = en,
      layout = el,
    }
  },
  use_layouts = { 'greek' }
})

-- Run automapping for built-in vim mappings
require('langmapper').automapping({ global = true, buffer = true })
