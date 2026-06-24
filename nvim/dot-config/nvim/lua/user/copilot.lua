-- Inline Chat Window
-- require("CopilotChat").setup({
--   window = {
--     layout = 'float',
--     relative = 'cursor',
--     width = 1,
--     height = 0.4,
--     row = 1
--   }
-- })

-- Side Window
require("CopilotChat").setup({
	window = {
	  layout = 'vertical',
	  width = 0.3, 
	}
})

-- Default Window Options - copied from ~/.local/share/nvim/plugged/CopilotChat.nvim/lua/CopilotChat/config.lua
-- require("CopilotChat").setup({
-- 	window = {
-- 	  layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
-- 	  width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
-- 	  height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
-- 	  -- Options below only apply to floating windows
-- 	  relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
-- 	  border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
-- 	  row = nil, -- row position of the window, default is centered
-- 	  col = nil, -- column position of the window, default is centered
-- 	  title = 'Copilot Chat', -- title of chat window
-- 	  footer = nil, -- footer of chat window
-- 	  zindex = 1, -- determines if window is on top or below other floating windows
-- 	  blend = 0, -- window blend (transparency), 0-100, 0 is opaque, 100 is fully transparent
-- 	}
-- })
