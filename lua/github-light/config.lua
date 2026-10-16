local M = {}

--- @type theme.Config
local defaults = {
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = {},
		keywords = {},
		functions = {},
		variables = {},
	},
}

--- Set the configuration.
--- @param opts theme.Config|nil User configuration
--- @return nil
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
end

--- Get the configuration.
--- @return theme.Config
function M.get()
	if not M.config then
		M.config = vim.deepcopy(defaults)
	end
	return M.config
end

return M
