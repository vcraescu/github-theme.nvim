local M = {}

--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	local blink_cmp = require("github-light.highlights.integrations.blink-cmp")
	local copilot = require("github-light.highlights.integrations.copilot")
	local fzf_lua = require("github-light.highlights.integrations.fzf-lua")
	local gitsigns = require("github-light.highlights.integrations.gitsigns")
	local nvim_tree = require("github-light.highlights.integrations.nvim-tree")

	return vim.tbl_extend(
		"force",
		{},
		blink_cmp.get(c),
		copilot.get(c),
		fzf_lua.get(c),
		gitsigns.get(c),
		nvim_tree.get(c)
	)
end

return M
