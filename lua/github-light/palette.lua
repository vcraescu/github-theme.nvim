-- GitHub Light Default: primer/github-vscode-theme, src/theme.js and src/colors.js.
-- Alpha colors use the white editor background.
local M = {}

M.white = "#FFFFFF" -- canvas.default
M.fg_default = "#1F2328" -- src/colors.js: light.fg.default
M.fg_muted = "#656D76" -- src/colors.js: light.fg.muted

M.gray = { -- @primer/primitives 7.10.0: scale.gray
	[0] = "#F6F8FA",
	"#EAEEF2",
	"#D0D7DE",
	"#AFB8C1",
	"#8C959F",
	"#6E7781",
	"#57606A",
	"#424A53",
	"#32383F",
	"#24292F",
}

M.blue = { -- @primer/primitives 7.10.0: scale.blue
	[0] = "#DDF4FF",
	"#B6E3FF",
	"#80CCFF",
	"#54AEFF",
	"#218BFF",
	"#0969DA",
	"#0550AE",
	"#033D8B",
	"#0A3069",
	"#002155",
}

M.green = { -- @primer/primitives 7.10.0: scale.green
	[0] = "#DAFBE1",
	"#ACEEBB",
	"#6FDD8B",
	"#4AC26B",
	"#2DA44E",
	"#1A7F37",
	"#116329",
	"#044F1E",
	"#003D16",
	"#002D11",
}

M.yellow = { -- @primer/primitives 7.10.0: scale.yellow
	[0] = "#FFF8C5",
	"#FAE17D",
	"#EAC54F",
	"#D4A72C",
	"#BF8700",
	"#9A6700",
	"#7D4E00",
	"#633C01",
	"#4D2D00",
	"#3B2300",
}

M.orange = { -- @primer/primitives 7.10.0: scale.orange
	[0] = "#FFF1E5",
	"#FFD8B5",
	"#FFB77C",
	"#FB8F44",
	"#E16F24",
	"#BC4C00",
	"#953800",
	"#762C00",
	"#5C2200",
	"#471700",
}

M.red = { -- @primer/primitives 7.10.0: scale.red
	[0] = "#FFEBE9",
	"#FFCECB",
	"#FFABA8",
	"#FF8182",
	"#FA4549",
	"#CF222E",
	"#A40E26",
	"#82071E",
	"#660018",
	"#4C0014",
}

M.purple = { -- @primer/primitives 7.10.0: scale.purple
	[0] = "#FBEFFF",
	"#ECD8FF",
	"#D8B9FF",
	"#C297FF",
	"#A475F9",
	"#8250DF",
	"#6639BA",
	"#512A97",
	"#3E1F79",
	"#2E1461",
}

M.ui = {
	cursorline = "#F4F6F8", -- editor.lineHighlightBackground: #eaeef280
	fold = "#F0F1F2", -- editor.foldBackground: #6e77811a
	search = "#FCF0BE", -- editor.findMatchHighlightBackground: #fae17d80
	match = "#D2F0DA", -- editorBracketMatch.background: #4ac26b40
	reference = "#F4F6F8", -- editor.wordHighlightBackground: #eaeef280
	inlay = "#EFF1F3", -- editorInlayHint.background: #afb8c133
	code = "#EFF1F3", -- textCodeBlock.background: #afb8c133
	add_line = "#E6FAEA", -- diffEditor.insertedLineBackground: #aceebb4d
	add_text = "#B7EEC5", -- diffEditor.insertedTextBackground: #6fdd8b80
	delete_line = "#FFF0EF", -- diffEditor.removedLineBackground: #ffcecb4d
	delete_text = "#FFCDCD", -- diffEditor.removedTextBackground: #ff818266
	change_text = "#EEDCAB", -- editor.stackFrameHighlightBackground: #d4a72c66
	visual = "#CEE1F8", -- src/theme.js: accent.fg at 20% opacity
}

M.terminal = {
	black = "#24292F", -- terminal.ansiBlack
	red = "#CF222E", -- terminal.ansiRed
	green = "#116329", -- terminal.ansiGreen
	yellow = "#4D2D00", -- terminal.ansiYellow
	blue = "#0969DA", -- terminal.ansiBlue
	magenta = "#8250DF", -- terminal.ansiMagenta
	cyan = "#1B7C83", -- terminal.ansiCyan
	white = "#6E7781", -- terminal.ansiWhite
	bright_black = "#57606A", -- terminal.ansiBrightBlack
	bright_red = "#A40E26", -- terminal.ansiBrightRed
	bright_green = "#1A7F37", -- terminal.ansiBrightGreen
	bright_yellow = "#633C01", -- terminal.ansiBrightYellow
	bright_blue = "#218BFF", -- terminal.ansiBrightBlue
	bright_magenta = "#A475F9", -- terminal.ansiBrightMagenta
	bright_cyan = "#3192AA", -- terminal.ansiBrightCyan
	bright_white = "#8C959F", -- terminal.ansiBrightWhite
}

return M
