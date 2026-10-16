local M = {}

--- Get syntax highlight groups
--- @param c theme.Colors Color palette
--- @param config theme.Config User configuration
--- @return theme.Highlights
function M.get(c, config)
	local util = require("github-light.util")
	local styles = util.get_styles(config)

	return {
		Boolean = { fg = c.variable_builtin },
		Character = { fg = c.string },
		Comment = styles.comments({ fg = c.comment }),
		Conditional = { link = "Keyword" },
		Constant = { fg = c.constant },
		Debug = { fg = c.warning },
		Define = { link = "Keyword" },
		Delimiter = { fg = c.delimiter },
		Error = { fg = c.error },
		Exception = { link = "Keyword" },
		Float = { fg = c.number },
		Function = styles.functions({ fg = c.func, nocombine = true }),
		Identifier = styles.variables({ fg = c.variable, nocombine = true }),
		Ignore = { fg = c.fg_dim },
		Include = { fg = c.include },
		Keyword = styles.keywords({ fg = c.keyword }),
		Label = { fg = c.label },
		Macro = styles.functions({ fg = c.metadata }),
		Number = { fg = c.number },
		Operator = { fg = c.operator },
		PreCondit = { link = "Keyword" },
		PreProc = { fg = c.metadata },
		Repeat = { link = "Keyword" },
		Special = { fg = c.special },
		SpecialChar = { fg = c.special_char },
		SpecialComment = styles.comments({ fg = c.comment_doc }),
		Statement = { link = "Keyword" },
		StorageClass = { link = "Keyword" },
		String = { fg = c.string },
		Structure = { link = "Keyword" },
		Tag = { fg = c.tag },
		Todo = { fg = c.todo },
		Type = { fg = c.type, nocombine = true },
		Typedef = { fg = c.type_definition },
		Underlined = { fg = c.link, underline = true },
		envField = { fg = c.keyword },
	}
end

return M
