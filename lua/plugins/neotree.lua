return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false, -- the sidebar is part of the layout, visible from the start

  config = function()
    require('neo-tree').setup {
      close_if_last_window = false,
      enable_git_status = true,
      filesystem = {
        -- show everything: dotfiles, gitignored, ignored-pattern files.
        -- nothing is hidden — filtered items would only be dimmed, never removed.
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_hidden = false,
          hide_by_name = {},
          hide_by_pattern = {},
          never_show = {},
        },
        -- reveal the current file in the tree, like VSCode's explorer
        follow_current_file = { enabled = true },
        -- neo-tree takes over from netrw entirely
        hijack_netrw_behavior = 'open_default',
        -- refresh the tree when files change outside Neovim
        use_libuv_file_watcher = true,
      },
      window = {
        position = 'right',
        width = 34,
      },
    }

    -- open the sidebar at startup without stealing focus
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('neotree-start', { clear = true }),
      callback = function()
        vim.cmd('Neotree show')
      end,
    })
  end,
}
