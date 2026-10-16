local M = {}

--- Get highlight groups shared by copilot.vim and copilot.lua
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		CopilotSuggestion = { fg = c.ghost_text },
		CopilotAnnotation = { link = "MoreMsg" },
	}
end

return M
