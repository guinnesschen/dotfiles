vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  severity_sort = true,
})

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#E46876", bg = "#1E1E1E" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#E6C384", bg = "#1E1E1E" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#8BA4B0", bg = "#1E1E1E" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#7AA89F", bg = "#1E1E1E" })

opt.fillchars:append({ eob = " " })
