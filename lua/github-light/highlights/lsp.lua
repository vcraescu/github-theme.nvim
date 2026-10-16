local M = {}

--- Get LSP highlight groups
--- @return theme.Highlights
function M.get()
	return {
		["@lsp.mod.documentation"] = { link = "@comment.documentation" },
		["@lsp.mod.format"] = { link = "@string.escape" },
		["@lsp.mod.readonly"] = { link = "@constant" },
		["@lsp.type.class"] = { link = "@type.definition" },
		["@lsp.type.comment"] = {},
		["@lsp.type.enum"] = { link = "@type.definition" },
		["@lsp.type.enumMember"] = { link = "@property" },
		["@lsp.type.function"] = { link = "@function.call" },
		["@lsp.type.interface"] = { link = "@type.definition" },
		["@lsp.type.macro"] = { link = "Macro" },
		["@lsp.type.method"] = { link = "@function.call" },
		["@lsp.type.property"] = {},
		["@lsp.type.struct"] = { link = "@type.definition" },
		["@lsp.typemod.class.declaration"] = { link = "@type.definition" },
		["@lsp.typemod.enum.declaration"] = { link = "@type.definition" },
		["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
		["@lsp.typemod.function.declaration"] = { link = "@function" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.function.definition"] = { link = "@function" },
		["@lsp.typemod.function.local"] = { link = "@function" },
		["@lsp.typemod.interface.declaration"] = { link = "@type.definition" },
		["@lsp.typemod.keyword.documentation"] = { link = "@comment.attribute" },
		["@lsp.typemod.method.definition"] = { link = "@function" },
		["@lsp.typemod.property.static"] = { link = "@constant" },
		["@lsp.typemod.type.declaration"] = { link = "@type.definition" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.definition"] = { link = "@type.definition" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.variable.local"] = { link = "@variable" },
		["@lsp.typemod.variable.signature"] = { link = "@variable" },
	}
end

return M
