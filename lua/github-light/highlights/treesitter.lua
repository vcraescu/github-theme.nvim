local M = {}

--- Get Treesitter highlights
--- @param c theme.Colors Color palette
--- @param config theme.Config Theme configuration
--- @return theme.Highlights
function M.get(c, config)
	local util = require("github-light.util")
	local styles = util.get_styles(config)

	return {
		["@annotation"] = { link = "PreProc" },
		["@array"] = { link = "@type" },
		["@attribute"] = { fg = c.attribute },
		["@attribute.builtin"] = { link = "@attribute" },
		["@boolean"] = { link = "Boolean" },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@class"] = { link = "@type" },
		["@comment"] = { link = "Comment" },
		["@comment.attribute"] = styles.comments({ fg = c.comment_tag }),
		["@comment.documentation"] = { link = "@comment" },
		["@comment.error"] = { link = "Todo" },
		["@comment.hint"] = { link = "Todo" },
		["@comment.info"] = { link = "Todo" },
		["@comment.note"] = { link = "Todo" },
		["@comment.todo"] = { link = "Todo" },
		["@comment.warning"] = { link = "Todo" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = c.constant_builtin, nocombine = true },
		["@constructor"] = { link = "@type" },
		["@diff.delta"] = { link = "DiffChange" },
		["@diff.minus"] = { bg = c.changes.delete.line_bg },
		["@diff.plus"] = { link = "DiffAdd" },
		["@enum"] = { link = "@type" },
		["@enummember"] = { link = "@property" },
		["@event"] = { link = "@constant" },
		["@field"] = { link = "@property" },
		["@file"] = { link = "@string.special.path" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = styles.functions({ fg = c.func_builtin }),
		["@function.call"] = styles.functions({ fg = c.func_call }),
		["@function.macro"] = { link = "Macro" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.call" },
		["@interface"] = { link = "@type" },
		["@key"] = { link = "@property" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.conditional.ternary"] = { link = "Operator" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },
		["@label"] = { link = "Label" },
		["@markup"] = { fg = c.fg },
		["@markup.heading"] = { fg = c.markup_heading, bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.link"] = { fg = c.link },
		["@markup.link.url"] = { link = "Underlined" },
		["@markup.list"] = { fg = c.markup_list },
		["@markup.list.checked"] = { fg = c.fg },
		["@markup.list.unchecked"] = { fg = c.fg },
		["@markup.math"] = { link = "Number" },
		["@markup.quote"] = { fg = c.markup_quote },
		["@markup.raw"] = { fg = c.markup_code },
		["@markup.raw.block"] = { fg = c.markup_code, bg = c.markup_code_bg },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.strong"] = { bold = true },
		["@markup.underline"] = { underline = true },
		["@method"] = { link = "@function.method" },
		["@method.call"] = { link = "@function.method.call" },
		["@module"] = { link = "Include" },
		["@module.builtin"] = { fg = c.constant_builtin },
		["@namespace"] = { link = "@module" },
		["@null"] = { link = "@constant.builtin" },
		["@number"] = { link = "Number" },
		["@object"] = { link = "@type" },
		["@operator"] = { link = "Operator" },
		["@package"] = { link = "@module" },
		["@parameter"] = { fg = c.parameter },
		["@property"] = { fg = c.property },
		["@punctuation"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = c.keyword },
		["@string"] = { link = "String" },
		["@string.documentation"] = { link = "SpecialComment" },
		["@string.escape"] = { fg = c.escape },
		["@string.regexp"] = { fg = c.regex },
		["@string.special"] = { link = "SpecialChar" },
		["@string.special.path"] = { fg = c.fg },
		["@string.special.symbol"] = { fg = c.constant },
		["@string.special.url"] = { link = "Underlined" },
		["@struct"] = { link = "@type" },
		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = c.attribute },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { link = "Tag" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = c.type_builtin },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "Keyword" },
		["@typeparameter"] = { link = "@type" },
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = c.variable_builtin },
		["@variable.member"] = { link = "@property" },
		["@variable.parameter"] = { link = "@parameter" },
		["@variable.parameter.builtin"] = { link = "@variable.builtin" },

		-- Lua
		["@constructor.lua"] = { link = "@punctuation.bracket" },

		-- YAML
		["@property.yaml"] = { link = "@property" },

		-- Proto
		["@property.proto"] = { fg = c.fg },
		["@type.proto"] = { link = "@type.definition" },

		-- Python
		["@variable.member.python"] = { fg = c.fg },

		-- HTML
		["@constant.html"] = { link = "@tag" },
		["@markup.heading.1.html"] = { link = "@markup" },
		["@markup.heading.2.html"] = { link = "@markup" },
		["@markup.heading.3.html"] = { link = "@markup" },
		["@markup.heading.4.html"] = { link = "@markup" },
		["@markup.heading.5.html"] = { link = "@markup" },
		["@markup.heading.6.html"] = { link = "@markup" },
		["@markup.heading.html"] = { link = "@markup" },

		-- Go
		["@string.special.url.gomod"] = { fg = c.string },
		["@string.special.url.gosum"] = { fg = c.string },
		["@variable.member.go"] = { fg = c.variable },
		["@property.go"] = { link = "@variable.member.go" },

		-- Markdown
		["@conceal.markdown_inline"] = { fg = c.keyword },
		["@label.markdown"] = { link = "@constant" },
		["@markup.heading.1.markdown"] = { link = "@markup.heading" },
		["@markup.heading.2.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.3.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.4.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.5.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.6.markdown"] = { link = "@markup.heading.1.markdown" },

		-- Bash
		["@function.call.bash"] = { link = "@function.builtin" },

		-- PHP
		["@attribute.phpdoc"] = { link = "@comment.attribute" },
		["@constructor.php"] = { link = "@function" },
		["@keyword.phpdoc"] = { link = "@variable" },
		["@type.php"] = { fg = c.fg },
		["@type.phpdoc"] = { link = "@type.definition" },
		["@variable.parameter.phpdoc"] = { link = "@variable" },

		-- CSS
		["@attribute.css"] = { link = "@tag" },
		["@property.css"] = {},

		-- Typescript / Javascript
		["@keyword.jsdoc"] = { link = "@comment.attribute" },
		["@type.jsdoc"] = { link = "@type.definition" },
		["@tag.tsx"] = { fg = c.special_tag },
	}
end

return M
