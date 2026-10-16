vim.opt.termguicolors = true -- true colors; the tab bar needs this
vim.opt.mouse = 'a' -- clicking tabs, close buttons, and splits

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- indentation: 2 spaces, never tab characters (keeps diffs and teammates happy)
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- search behaves like VSCode: case-insensitive unless you type a capital
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- new splits open on the right / below, like VSCode editors
vim.opt.splitright = true
vim.opt.splitbelow = true
