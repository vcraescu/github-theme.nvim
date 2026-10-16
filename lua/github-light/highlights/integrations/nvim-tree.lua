local M = {}

--- Get NvimTree highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		NvimTreeNormal = { fg = c.fg_bright, bg = c.none },
		NvimTreeWinSeparator = { fg = c.border, bg = c.none },

		NvimTreeRootFolder = { fg = c.comment },

		NvimTreeFolderName = { link = "NvimTreeNormal" },
		NvimTreeFolderIcon = { link = "NvimTreeNormal" },
		NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },

		NvimTreeOpenedFile = { link = "NvimTreeNormal" },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeExecFile = { fg = c.fg },
		NvimTreeImageFile = { fg = c.constant },
		NvimTreeSymlink = { fg = c.link, underline = true },

		NvimTreeGitDirty = { fg = c.changes.change.fg },
		NvimTreeGitDirtyIcon = { link = "NvimTreeGitDirty" },
		NvimTreeGitStaged = { fg = c.changes.change.fg },
		NvimTreeGitStagedIcon = { link = "NvimTreeGitStaged" },
		NvimTreeGitMerge = { fg = c.changes.conflict.fg },
		NvimTreeGitMergeIcon = { link = "NvimTreeGitMerge" },
		NvimTreeGitRenamed = { fg = c.changes.change.fg },
		NvimTreeGitRenamedIcon = { link = "NvimTreeGitRenamed" },
		NvimTreeGitNew = { fg = c.changes.add.fg },
		NvimTreeGitNewIcon = { link = "NvimTreeGitNew" },
		NvimTreeGitDeleted = { fg = c.changes.delete.fg },
		NvimTreeGitDeletedIcon = { link = "NvimTreeGitDeleted" },
		NvimTreeGitIgnored = { link = "Ignore" },
		NvimTreeGitIgnoredIcon = { link = "NvimTreeGitIgnored" },

		NvimTreeCursorLine = { link = "PmenuSel" },
		-- Set the inactive cursor line.
		NvimTreeCursorLineNC = { link = "QuickFixLine" },

		NvimTreeIndentMarker = { fg = c.comment },

		NvimTreeWindowPicker = { link = "PmenuSel" },

		NvimTreeStatusLine = { link = "StatusLine" },
		NvimTreeStatusLineNC = { link = "StatusLineNC" },
	}
end

return M
