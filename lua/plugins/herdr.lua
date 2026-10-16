-- herdr-nvim: reference code and send review comments to the coding agents
-- running in your herdr workspace.
--
-- The herdr-side half (sidebar + file picker, prefix+e / prefix+o) is installed
-- with `herdr plugin install ChmaraX/herdr-nvim`; this is the nvim half.
--
-- Default keymaps (leader = space):
--   space ai  :Herdr ref      drop `path:12-20` into the agent's input
--   space ac  :Herdr comment  comment the current line / selection
--   space as  :Herdr send     paste all comments into the agent's input
--   space aS  :Herdr submit   send all comments and submit
--   space al  :Herdr list     list / edit / delete pending comments
return {
  'ChmaraX/herdr-nvim',
  opts = {},
}
