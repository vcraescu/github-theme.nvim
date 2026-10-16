local M = {}

--- Load and combine highlights from all modules
--- @param colors theme.Colors Color palette
--- @param config theme.Config User configuration
--- @return table Combined highlight groups
function M.setup(colors, config)
	-- Load all highlight modules
	local editor = require("github-light.highlights.editor")
	local syntax = require("github-light.highlights.syntax")
	local treesitter = require("github-light.highlights.treesitter")
	local lsp = require("github-light.highlights.lsp")
	local diagnostics = require("github-light.highlights.diagnostics")
	local integrations = require("github-light.highlights.integrations")

	-- Combine all highlights
	local highlights = vim.tbl_extend(
		"force",
		{},
		editor.get(colors),
		syntax.get(colors, config),
		treesitter.get(colors, config),
		lsp.get(),
		diagnostics.get(colors),
		integrations.get(colors)
	)

	-- Apply user overrides (supports both 'overrides' and 'on_highlights')
	if config.overrides and type(config.overrides) == "function" then
		highlights = vim.tbl_extend("force", highlights, config.overrides(colors))
	end

	-- Apply on_highlights (receives highlights table and can modify it directly)
	if config.on_highlights and type(config.on_highlights) == "function" then
		config.on_highlights(highlights, colors)
	end

	return highlights
end

return M
