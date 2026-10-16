local M = {}

--- Apply highlight groups.
--- @param groups theme.Highlights Highlight groups
--- @return nil
function M.load_highlights(groups)
	for group, opts in pairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

--- Apply background options to a color copy.
--- @param colors theme.Colors Color palette
--- @param config theme.Config User configuration
--- @return theme.Colors
function M.apply_overrides(colors, config)
	colors = vim.deepcopy(colors)
	if config.transparent then
		colors.bg = colors.none
		colors.fold_bg = colors.none
	end
	return colors
end

--- Get style functions.
--- @param config theme.Config User configuration
--- @return table<string, fun(highlight: table): table>
function M.get_styles(config)
	local styles = {}
	for _, name in ipairs({ "comments", "keywords", "functions", "variables" }) do
		local style = (config.styles or {})[name] or {}
		--- Apply the configured style.
		--- @param highlight table Highlight attributes
		--- @return table
		styles[name] = function(highlight)
			return vim.tbl_extend("force", highlight, style)
		end
	end
	return styles
end

return M
