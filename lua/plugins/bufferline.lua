return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false, -- the tab bar is part of the layout

  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- one tab per open file, like VSCode
        diagnostics = 'nvim_lsp', -- error dots on tabs once LSP is set up
        show_buffer_close_icons = true, -- little x on each tab
        show_close_icon = false,
        separator_style = 'thin',
        -- keep the tab bar from drawing above the file tree
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
      },
    }

    -- moving between tabs
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next tab' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous tab' })
    -- VSCode muscle memory; if the terminal can't send these, <Tab>/<S-Tab> always work
    vim.keymap.set('n', '<C-Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next tab' })
    vim.keymap.set('n', '<C-S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous tab' })

    -- close the tab you're on (same as clicking its x)
    vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>', { desc = 'Close tab' })
  end,
}
