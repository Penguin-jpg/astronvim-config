-- Uilities about colorschemes (not working)

local M = {}

local DEFAULT_COLORSCHEME = "astrodark"

M.get_theme = function(theme)
    -- check status of theme
    local status_ok, _ = pcall(require, theme)
    if status_ok then
        return theme
    end
    require "astronvim.utils".notify(theme .. " is not ready", vim.log.levels.ERROR)
    return DEFAULT_COLORSCHEME
end

return M