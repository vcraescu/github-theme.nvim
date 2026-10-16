--- @type theme.Colors
local M = {}
local palette = require("github-light.palette")

-- Backgrounds
M.bg = palette.white
M.bg_gutter = palette.gray[0]
M.bg_surface = palette.white
M.bg_highlight = palette.ui.inlay

-- Foregrounds
M.fg = palette.fg_default
M.fg_muted = palette.fg_muted
M.fg_dim = palette.gray[5]
M.fg_bright = palette.fg_default
M.fg_inlay = palette.fg_muted

-- Editor
M.border = palette.gray[2]
M.cursor = palette.blue[5]
M.cursorline = palette.ui.cursorline
M.quickfixline = palette.blue[0]
M.visual = palette.ui.visual
M.line_number = palette.gray[4]
M.line_number_current = palette.fg_default
M.whitespace = palette.gray[3]
M.color_column = palette.gray[0]
M.fold_bg = palette.ui.fold
M.fold_fg = palette.fg_muted
M.ghost_text = palette.gray[5]
M.directory = palette.blue[5]
M.markup_code_bg = palette.ui.code
M.markup_code = palette.blue[6]
M.markup_heading = palette.blue[6]
M.markup_list = palette.orange[6]
M.markup_quote = palette.green[6]

-- Keywords and literals
M.keyword = palette.red[5]
M.string = palette.blue[8]
M.number = palette.blue[6]

-- Functions and methods
M.func = palette.purple[5]
M.func_builtin = palette.blue[6]
M.func_call = palette.purple[5]

-- Variables and parameters
M.variable = palette.fg_default
M.variable_builtin = palette.blue[6]
M.parameter = palette.fg_default
M.property = palette.blue[6]

-- Types and constants
M.type = palette.orange[6]
M.type_builtin = palette.blue[6]
M.type_definition = palette.orange[6]
M.constant = palette.blue[6]
M.constant_builtin = palette.blue[6]

-- Comments
M.comment = palette.gray[5]
M.comment_doc = palette.gray[5]
M.comment_tag = palette.gray[5]

-- Operators and punctuation
M.operator = palette.red[5]
M.delimiter = palette.fg_default

-- Tags and attributes
M.tag = palette.green[6]
M.attribute = palette.fg_default
M.special_tag = palette.green[6]

-- Labels and special syntax
M.label = palette.orange[6]
M.metadata = palette.blue[6]
M.special = palette.blue[6]
M.special_char = palette.red[5]
M.escape = palette.red[5]
M.regex = palette.blue[8]
M.include = palette.fg_default

-- Diagnostics and LSP
M.error = palette.red[5]
M.warning = palette.yellow[5]
M.info = palette.blue[5]
M.hint = palette.fg_muted
M.ok = palette.green[5]
M.lsp_reference = palette.ui.reference

-- Search
M.search = palette.ui.search
M.search_match = palette.blue[5]
M.search_current = palette.yellow[4]
M.match = palette.ui.match

-- Shared Git and diff colors
M.changes = {
	add = {
		fg = palette.green[5],
		line_bg = palette.ui.add_line,
		text_bg = palette.ui.add_text,
	},
	change = {
		fg = palette.yellow[5],
		line_bg = palette.yellow[0],
		text_bg = palette.ui.change_text,
	},
	conflict = {
		fg = palette.orange[5],
		line_bg = palette.orange[0],
		text_bg = palette.orange[1],
	},
	delete = {
		fg = palette.red[5],
		line_bg = palette.ui.delete_line,
		text_bg = palette.ui.delete_text,
	},
}

-- Special elements
M.todo = palette.yellow[5]
M.link = palette.blue[5]
M.none = "NONE"
M.terminal = palette.terminal

return M
