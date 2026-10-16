local M = {}

--- Get BlinkCmp highlight groups
--- @param c theme.Colors palette
--- @return theme.Highlights
function M.get(c)
	return {
		BlinkCmpMenuBorder = { link = "FloatBorder" },
		BlinkCmpLabelMatch = { fg = c.search_match, bg = c.none, bold = true },

		BlinkCmpKind = { link = "@type" },
		BlinkCmpKindClass = { link = "@class" },
		BlinkCmpKindColor = { link = "@constant" },
		BlinkCmpKindConstant = { link = "@constant" },
		BlinkCmpKindConstructor = { link = "@constructor" },
		BlinkCmpKindEnum = { link = "@enum" },
		BlinkCmpKindEnumMember = { link = "@enummember" },
		BlinkCmpKindEvent = { link = "@event" },
		BlinkCmpKindField = { link = "@field" },
		BlinkCmpKindFile = { link = "@file" },
		BlinkCmpKindFolder = { link = "Directory" },
		BlinkCmpKindFunction = { link = "@function" },
		BlinkCmpKindInterface = { link = "@interface" },
		BlinkCmpKindKeyword = { link = "@keyword" },
		BlinkCmpKindMethod = { link = "@method" },
		BlinkCmpKindModule = { link = "@module" },
		BlinkCmpKindOperator = { link = "@operator" },
		BlinkCmpKindProperty = { link = "@property" },
		BlinkCmpKindReference = { link = "@markup.link" },
		BlinkCmpKindSnippet = { link = "@string" },
		BlinkCmpKindStruct = { link = "@struct" },
		BlinkCmpKindText = { link = "@markup" },
		BlinkCmpKindTypeParameter = { link = "@typeparameter" },
		BlinkCmpKindUnit = { link = "@constant" },
		BlinkCmpKindValue = { link = "@constant" },
		BlinkCmpKindVariable = { link = "@variable" },

		BlinkCmpLabelDetail = { fg = c.comment, bg = c.none },

		BlinkCmpDocBorder = { link = "FloatBorder" },
		BlinkCmpDocSeparator = { link = "FloatBorder" },

		BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
		BlinkCmpSignatureHelpActiveParameter = { fg = c.parameter, bg = c.none, bold = true },

		BlinkCmpGhostText = { fg = c.ghost_text },
	}
end

return M
