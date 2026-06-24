-- Custom copy function that works with tmux
local function copy_to_clipboard(prompt_bufnr)
    local t_actions = require('telescope.actions')
    local t_actions_state = require('telescope.actions.state')
    
    t_actions.close(prompt_bufnr)
    local selection = t_actions_state.get_selected_entry()
    local cheatcode = selection.value.cheatcode
    
    -- Try system clipboard first (works with tmux)
    vim.fn.setreg('+', cheatcode)
    -- Also set to vim's default register
    vim.fn.setreg('"', cheatcode)
    -- And to register 0 for consistency
    vim.fn.setreg('0', cheatcode)
    
    vim.api.nvim_echo(
        { { "Yanked to clipboard: ", "" }, { cheatcode, "cheatCode" } },
        false, {}
    )
end

require("cheatsheet").setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    -- bundled_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- },
    bundled_cheatsheets = true,

    -- For plugin specific cheatsheets
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }
    bundled_plugin_cheatsheets = true,

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,

    -- Key mappings bound inside the telescope window
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = copy_to_clipboard,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})
