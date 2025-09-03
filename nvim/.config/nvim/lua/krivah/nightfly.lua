vim.g.nightflyCursorColor = true
vim.g.nightflyWinSeparator = 2
vim.g.nightflyVirtualTextColor = true
vim.cmd [[colorscheme nightfly]]
vim.cmd [[highlight! link CmpItemMenu NonText]]
vim.cmd [[hi DiagnosticVirtualTextError guibg=#26202f guifg=#fc514e]]
vim.cmd [[hi DiagnosticVirtualTextWarn guibg=#223338 guifg=#e3d18a]]
vim.cmd [[hi! TSNodeKey gui=NONE guibg=NONE guifg=#f0525c cterm=NONE]]
vim.cmd [[hi! link TSNodeUnmatched NonText]]
vim.cmd [[hi! link CmpItemKindCodeium NightflyOrange]]
vim.cmd [[hi! link OilCreate NightflyGreen]]
vim.cmd [[hi! link OilDelete NightflyRed]]
vim.cmd [[hi! link OilMove NightflyYellow]]
vim.cmd [[hi! link OilCopy NightflyTurquoise]]
vim.cmd [[hi! link OilChange NightflyOrange]]

local hi = vim.api.nvim_set_hl
hi(0, "@lsp.type.property.lua", { link = "NightflyTurquoise" })
hi(0, "@variable.member.lua", { link = "NightflyTurquoise" })
hi(0, "@lsp.type.property.lua", { link = "NightflyTurquoise" })
hi(0, "@property.yaml", { link = "NightflyTurquoise" })
hi(0, "@property.toml", { link = "NightflyTurquoise" })
hi(0, "@variable.member.rust", { link = "NightflyTurquoise" })
hi(0, "@lsp.type.property.rust", { link = "NightflyTurquoise" })
-- hi(0, "@function.macro.rust", { link = "NightflyLavender" })
hi(0, "@function.macro.rust", { link = "NightflyMalibu" })
