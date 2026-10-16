local M = {}

--- Load the colorscheme
--- @return nil
function M.load()
	vim.o.background = "light"
	vim.o.termguicolors = true
	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "github-light"

	local config = require("github-light.config")
	local colors = require("github-light.colors")
	local util = require("github-light.util")
	local highlights = require("github-light.highlights")

	-- Get configuration
	config = config.get()
	colors = util.apply_overrides(colors, config)

	-- Get all highlights
	local highlight_groups = highlights.setup(colors, config)

	-- Apply all highlights
	util.load_highlights(highlight_groups)

	-- Set terminal colors if enabled
	if config.terminal_colors then
		vim.g.terminal_color_0 = colors.terminal.black
		vim.g.terminal_color_1 = colors.terminal.red
		vim.g.terminal_color_2 = colors.terminal.green
		vim.g.terminal_color_3 = colors.terminal.yellow
		vim.g.terminal_color_4 = colors.terminal.blue
		vim.g.terminal_color_5 = colors.terminal.magenta
		vim.g.terminal_color_6 = colors.terminal.cyan
		vim.g.terminal_color_7 = colors.terminal.white

		vim.g.terminal_color_8 = colors.terminal.bright_black
		vim.g.terminal_color_9 = colors.terminal.bright_red
		vim.g.terminal_color_10 = colors.terminal.bright_green
		vim.g.terminal_color_11 = colors.terminal.bright_yellow
		vim.g.terminal_color_12 = colors.terminal.bright_blue
		vim.g.terminal_color_13 = colors.terminal.bright_magenta
		vim.g.terminal_color_14 = colors.terminal.bright_cyan
		vim.g.terminal_color_15 = colors.terminal.bright_white
	end
end

--- Setup the colorscheme with custom configuration
---@param opts theme.Config|nil User configuration options
---@return nil
function M.setup(opts)
	opts = opts or {}
	local config = require("github-light.config")

	config.setup(opts)
end

--- Get fzf color string for use with fzf-lua or fzf
--- @return string FZF color configuration string
function M.get_fzf_colors()
	local colors = require("github-light.colors")
	local config = require("github-light.config").get()
	local bg = config.transparent and colors.none or colors.bg

	return table.concat({
		"fg:" .. colors.fg,
		"bg:" .. bg,
		"hl:" .. colors.search_match,
		"fg+:" .. colors.fg_bright,
		"bg+:" .. colors.visual,
		"hl+:" .. colors.search_match,
		"info:" .. colors.warning,
		"prompt:" .. colors.keyword,
		"pointer:" .. colors.constant,
		"marker:" .. colors.changes.add.fg,
		"spinner:" .. colors.number,
		"header:" .. colors.type,
		"border:" .. colors.border,
		"label:" .. colors.fg,
		"query:" .. colors.fg,
		"gutter:" .. bg,
		"selected-bg:" .. colors.bg_surface,
	}, ",")
end

return M
