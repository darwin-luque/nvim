vim.g.mapleader = " "

-- toggle the file tree: open focused (like :Ex used to) / close if already open.
-- neo-tree's own "toggle" is unreliable right at startup, so decide explicitly.
vim.keymap.set("n", "<leader>cd", function()
  local open = false
  for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.bo[vim.api.nvim_win_get_buf(w)].filetype == "neo-tree" then
      open = true
      break
    end
  end
  vim.cmd(open and "Neotree close" or "Neotree focus")
end, { desc = "Toggle file tree" })
