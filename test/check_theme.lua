vim.opt.runtimepath:prepend(vim.fn.getcwd())

local theme = require("github-light")
local colors = require("github-light.colors")
local palette = require("github-light.palette")
local util = require("github-light.util")
local source = vim.json.decode(table.concat(vim.fn.readfile("test/fixtures/light-default.json"), "\n"))
local original_colors = vim.deepcopy(colors)
local original_palette = vim.deepcopy(palette)

--- Convert a source color to an opaque color on white.
--- @param value string Source hex color
--- @return string
local function opaque(value)
	if #value == 7 then
		return value:upper()
	end
	local alpha = tonumber(value:sub(8, 9), 16) / 255
	local channels = {}
	for index = 2, 6, 2 do
		local channel = tonumber(value:sub(index, index + 1), 16)
		channels[#channels + 1] = string.format("%02X", math.floor(channel * alpha + 255 * (1 - alpha) + 0.5))
	end
	return "#" .. table.concat(channels)
end

--- Check a resolved highlight color.
--- @param group string Highlight group
--- @param attribute string Color attribute
--- @param expected string Hex color or NONE
--- @return nil
local function assert_highlight(group, attribute, expected)
	local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
	local value = expected ~= "NONE" and tonumber(expected:sub(2), 16) or nil
	assert(highlight[attribute] == value, group .. "." .. attribute .. ": " .. vim.inspect(highlight))
end

local source_roles = {
	bg = "editor.background",
	fg = "editor.foreground",
	fg_muted = "descriptionForeground",
	bg_gutter = "sideBar.background",
	bg_surface = "statusBar.background",
	border = "tab.border",
	cursor = "editorCursor.foreground",
	cursorline = "editor.lineHighlightBackground",
	fold_bg = "editor.foldBackground",
	line_number = "editorLineNumber.foreground",
	whitespace = "editorWhitespace.foreground",
	search = "editor.findMatchHighlightBackground",
	search_current = "editor.findMatchBackground",
	match = "editorBracketMatch.background",
	markup_code_bg = "textCodeBlock.background",
	bg_highlight = "editorInlayHint.background",
	fg_inlay = "editorInlayHint.foreground",
	error = "errorForeground",
	warning = "notificationsWarningIcon.foreground",
	info = "notificationsInfoIcon.foreground",
	ok = "gitDecoration.addedResourceForeground",
}
for role, source_key in pairs(source_roles) do
	assert(colors[role] == opaque(source.colors[source_key]), role .. " differs from GitHub Light Default")
end

local token_roles = {
	comment = "comment",
	keyword = "keyword",
	string = "string",
	number = "constant",
	func = "entity.name.function",
	func_call = "entity.name.function",
	func_builtin = "support",
	tag = "entity.name.tag",
	property = "meta.property-name",
	type = "entity.name",
	constant = "constant",
	markup_heading = "markup.heading",
	markup_code = "markup.inline.raw",
	markup_quote = "markup.quote",
}
for role, scope in pairs(token_roles) do
	local expected
	for _, token in ipairs(source.tokenColors) do
		local scopes = type(token.scope) == "table" and token.scope or { token.scope }
		if vim.tbl_contains(scopes, scope) then
			expected = token.settings.foreground
		end
	end
	assert(expected and colors[role] == opaque(expected), role .. " differs from source token " .. scope)
end

for _, change in ipairs({
	{ colors.changes.add.line_bg, "diffEditor.insertedLineBackground" },
	{ colors.changes.add.text_bg, "diffEditor.insertedTextBackground" },
	{ colors.changes.delete.line_bg, "diffEditor.removedLineBackground" },
	{ colors.changes.delete.text_bg, "diffEditor.removedTextBackground" },
	{ colors.changes.change.fg, "gitDecoration.modifiedResourceForeground" },
	{ colors.changes.delete.fg, "gitDecoration.deletedResourceForeground" },
	{ colors.changes.conflict.fg, "gitDecoration.conflictingResourceForeground" },
}) do
	assert(change[1] == opaque(source.colors[change[2]]), "Change color differs from " .. change[2])
end
assert(colors.visual == opaque("#0969da33"))

local terminal_names = {
	"black",
	"red",
	"green",
	"yellow",
	"blue",
	"magenta",
	"cyan",
	"white",
	"bright_black",
	"bright_red",
	"bright_green",
	"bright_yellow",
	"bright_blue",
	"bright_magenta",
	"bright_cyan",
	"bright_white",
}
for _, transparent in ipairs({ false, true, false }) do
	theme.setup({ transparent = transparent })
	vim.cmd("colorscheme github-light")
	assert(vim.g.colors_name == "github-light")
	assert(vim.o.background == "light")
	assert(vim.o.termguicolors)
	for _, group in ipairs({ "Normal", "NormalNC", "NormalFloat", "FloatTitle", "Pmenu" }) do
		assert_highlight(group, "bg", transparent and colors.none or colors.bg)
	end
	assert_highlight("Normal", "fg", colors.fg)
	assert_highlight("StatusLine", "bg", colors.bg_surface)
	assert_highlight("StatusLineNC", "bg", colors.bg_gutter)
	assert_highlight("Folded", "bg", transparent and colors.none or colors.fold_bg)
	assert_highlight("Visual", "bg", colors.visual)
	assert_highlight("CurSearch", "bg", colors.search_current)
	assert_highlight("Search", "bg", colors.search)
	assert_highlight("Keyword", "fg", colors.keyword)
	assert_highlight("String", "fg", colors.string)
	assert_highlight("@function.call", "fg", colors.func)
	assert_highlight("@lsp.type.function", "fg", colors.func)
	assert_highlight("@constant.lua", "fg", colors.constant)
	assert_highlight("@property.yaml", "fg", colors.property)
	assert_highlight("@tag.tsx", "fg", colors.tag)
	assert_highlight("@markup.heading.1.markdown", "fg", colors.markup_heading)
	assert_highlight("@markup.raw.block", "bg", colors.markup_code_bg)
	assert_highlight("DiagnosticOk", "fg", colors.ok)
	assert_highlight("DiagnosticUnderlineError", "sp", colors.error)
	assert_highlight("DiffText", "fg", colors.none)
	assert_highlight("DiffTextAdd", "bg", colors.changes.change.text_bg)
	assert_highlight("BlinkCmpKindFunction", "fg", colors.func)
	assert_highlight("CopilotSuggestion", "fg", colors.ghost_text)
	assert_highlight("FzfLuaFzfMatch", "fg", colors.search_match)
	assert_highlight("NvimTreeGitDeleted", "fg", colors.changes.delete.fg)
	assert_highlight("NvimTreeGitMerge", "fg", colors.changes.conflict.fg)
	for _, kind in ipairs({ "Add", "Change", "Delete" }) do
		local change = colors.changes[kind:lower()]
		assert_highlight("GitSigns" .. kind, "fg", change.fg)
		assert_highlight("GitSigns" .. kind .. "LnInline", "bg", colors.changes.change.text_bg)
		if kind ~= "Delete" then
			assert_highlight("Diff" .. kind, "bg", change.line_bg)
		end
	end
	assert_highlight("GitSignsDeleteVirtLn", "bg", colors.changes.delete.line_bg)
	for index, name in ipairs(terminal_names) do
		local source_name = name:gsub("^%l", string.upper):gsub("_(%l)", string.upper)
		local expected = opaque(source.colors["terminal.ansi" .. source_name])
		assert(colors.terminal[name] == expected)
		assert(vim.g["terminal_color_" .. (index - 1)] == expected)
	end
	assert(theme.get_fzf_colors():find("fg:" .. colors.fg, 1, true))
	assert(theme.get_fzf_colors():find("bg:" .. (transparent and colors.none or colors.bg), 1, true))
end

local transparent_colors = util.apply_overrides(colors, { transparent = true })
transparent_colors.changes.add.fg = colors.keyword
transparent_colors.terminal.red = colors.string
assert(vim.deep_equal(colors, original_colors))
assert(vim.deep_equal(palette, original_palette))

local callback_order = {}
theme.setup({
	--- Return highlight overrides.
	--- @param c theme.Colors Color palette
	--- @return theme.Highlights
	overrides = function(c)
		callback_order[#callback_order + 1] = "overrides"
		return { Function = { fg = c.keyword, bold = true } }
	end,
	--- Modify the final highlights.
	--- @param highlights theme.Highlights Highlight groups
	--- @param c theme.Colors Color palette
	--- @return nil
	on_highlights = function(highlights, c)
		callback_order[#callback_order + 1] = "on_highlights"
		assert(highlights.Function.fg == c.keyword)
		highlights.Function.fg = c.tag
	end,
})
theme.load()
assert(vim.deep_equal(callback_order, { "overrides", "on_highlights" }))
assert_highlight("Function", "fg", colors.tag)
assert(vim.api.nvim_get_hl(0, { name = "Function", link = false }).bold)

theme.setup({ styles = { functions = { italic = true }, comments = { italic = true } } })
theme.load()
for _, group in ipairs({ "Function", "@function", "@function.builtin", "Comment", "@comment" }) do
	assert(vim.api.nvim_get_hl(0, { name = group, link = false }).italic, "Missing style: " .. group)
end
vim.api.nvim_set_hl(0, "Function", { fg = tonumber(colors.keyword:sub(2), 16) })
assert_highlight("@function", "fg", colors.keyword)

theme.setup({ terminal_colors = false })
for index = 0, 15 do
	vim.g["terminal_color_" .. index] = "unchanged"
end
theme.load()
for index = 0, 15 do
	assert(vim.g["terminal_color_" .. index] == "unchanged")
end
assert_highlight("Function", "fg", colors.func)
assert(not vim.api.nvim_get_hl(0, { name = "Function", link = false }).italic)
assert(not vim.api.nvim_get_hl(0, { name = "Constant", link = false }).italic)
assert(vim.deep_equal(colors, original_colors))
assert(vim.deep_equal(palette, original_palette))

print("GitHub Light theme checks passed")
