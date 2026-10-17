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
        -- show everything — dotfiles, gitignored, and ignored-pattern files all
        -- list normally (VSCode behavior). the only exclusions are VSCode's own
        -- defaults: .git internals and OS junk. press H in the tree to reveal them.
        filtered_items = {
          visible = false,
          show_hidden_count = false, -- no "(N hidden items)" footer
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_hidden = false,
          hide_by_name = { '.git', '.DS_Store', 'Thumbs.db' },
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
