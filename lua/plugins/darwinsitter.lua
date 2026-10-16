return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    -- Parsers and queries are installed here and prepended to 'runtimepath'.
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    -- Languages to keep a parser for:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
    local parsers = {
      'angular',
      'astro',
      'bash',
      'cpp',
      'css',
      'csv',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'goctl',
      'gomod',
      'gosum',
      'graphql',
      'html',
      'html_tags',
      'htmldjango',
      'http',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'jsx',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'mermaid',
      'nginx',
      'prisma',
      'python',
      'regex',
      'rust',
      'scss',
      'sql',
      'ssh_config',
      'svelte',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'vue',
      'xml',
      'yaml',
      'zig',
      'ziggy',
      'ziggy_schema',
      'zsh',
    }

    -- Highlighting and indent are no longer configured on nvim-treesitter itself;
    -- Neovim core enables them per buffer (`:h treesitter-highlight`).
    -- `vim.treesitter.start()` raises when the filetype has no parser yet, so guard it.
    local function enable_treesitter(buf)
      if not vim.api.nvim_buf_is_loaded(buf) or vim.bo[buf].filetype == '' then
        return
      end
      if pcall(vim.treesitter.start, buf) then
        -- treesitter indent (experimental): https://github.com/nvim-treesitter/nvim-treesitter#indentation
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('darwinsitter', { clear = true }),
      callback = function(ev)
        enable_treesitter(ev.buf)
      end,
    })

    -- Download + compile anything missing (no-op once installed).
    -- Buffers that opened before the parsers finished get enabled here.
    require('nvim-treesitter').install(parsers):await(function(err)
      if err then
        return
      end
      vim.schedule(function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          enable_treesitter(buf)
        end
      end)
    end)
  end,
}
