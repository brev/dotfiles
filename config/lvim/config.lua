-- LunarVim Config
--  Changes? => Restart, :PackerInstall, :PackerCompile, Restart.

-- @TODO: postcss better / real
-- @TODO: i18n / l10n

-- Settings
lvim.colorscheme = 'catppuccin'
lvim.format_on_save = true
lvim.log.level = 'warn'

-- Core Plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = 'dashboard'
lvim.builtin.gitsigns.opts.signs.delete.text = lvim.icons.ui.BoldLineLeft
lvim.builtin.indentlines.options.show_current_context = false
lvim.builtin.lualine.on_config_done = function(lualine)
  local config = lualine.get_config()
  local lsp = config.sections.lualine_x[2]
  lsp.fmt = function(str) return string.gsub(str, ',? ?trim_%a+', '') end
  lualine.setup(config)
end
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.setup.renderer.icons = {
  glyphs = {
    folder = {
      arrow_open = '▽',
      arrow_closed = '▷',
    },
  },
  show = { git = false },
}

-- Keymappings
lvim.leader = 'space'
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.builtin.which_key.mappings.b.b = nil
lvim.builtin.which_key.mappings.b.h = {
  '<cmd>BufferLineCyclePrev<cr>', 'Previous'
}
lvim.builtin.which_key.mappings.b.l = { '<cmd>BufferLineCycleNext<cr>', 'Next' }
lvim.builtin.which_key.mappings.b.m = {
  name = 'Move',
  h = { '<cmd>BufferLineMovePrev<cr>', 'Previous' },
  l = { '<cmd>BufferLineMoveNext<cr>', 'Next' },
}
lvim.builtin.which_key.mappings.b.n = nil
lvim.builtin.which_key.mappings.g.S = {
  '<cmd>Gitsigns stage_buffer<cr>', 'Stage Buffer'
}
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.n = { '<cmd>nohlsearch<CR>', 'No Highlight' }
lvim.builtin.which_key.mappings.s.F = {
  '<cmd>Telescope oldfiles<cr>', 'Open Recent File'
}
lvim.builtin.which_key.mappings.s.r = {
  [[<cmd>lua require('spectre').open()<cr>]], 'and Replace'
}
lvim.builtin.which_key.mappings.t = {
  name = 'Diagnostics',
  t = { '<cmd>TroubleToggle<cr>', 'Trouble' },
  w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
  d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Document' },
  q = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix' },
  l = { '<cmd>TroubleToggle loclist<cr>', 'Loclist' },
  r = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
}

-- Treesitters
lvim.builtin.treesitter.ensure_installed = {
  'bash',
  'css',
  'dockerfile',
  'gitattributes',
  'gitignore',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'svelte',
  'typescript',
  'vim',
  'yaml',
}
lvim.builtin.treesitter.ignore_install = { 'haskell' }
lvim.builtin.treesitter.highlight.enabled = true

-- Language Servers
lvim.lsp.installer.setup.ensure_installed = {
  'bash-language-server',
  'css-lsp',
  'dockerfile-language-server',
  'eslint_d',
  'hadolint',
  'html-lsp',
  'json-lsp',
  'lemminx',
  'lua-language-server',
  'marksman',
  'prettierd',
  'svelte-language-server',
  'typescript-language-server',
  'vim-language-server',
  'yaml-language-server',
}

-- Formatters
local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  { command = 'beautysh' },
  {
    command = 'prettierd',
    filetypes = {
      'css',
      'html',
      'javascript',
      'json',
      'markdown',
      'postcss',
      'svelte',
      'typescript',
      'yaml'
    },
  },
  { command = 'trim_newlines' },
  { command = 'trim_whitespace' },
  { command = 'xmllint' },
})

-- Linters
local linters = require('lvim.lsp.null-ls.linters')
linters.setup({
  {
    command = 'eslint_d',
    filetypes = { 'javascript', 'svelte', 'typescript' },
  },
  { command = 'hadolint' },
  { command = 'jsonlint' },
  { command = 'markdownlint' },
  { command = 'shellcheck' },
  {
    command = 'stylelint',
    filetypes = { 'css', 'postcss' },
  },
  { command = 'yamllint' },
  { command = 'zsh' },
})

-- Extra Plugins
lvim.plugins = {
  -- catppuccin
  { 'catppuccin/nvim', as = 'catppuccin' },

  -- dark-mode
  {
    'f-person/auto-dark-mode.nvim',
    config = function()
      local auto_dark_mode = require('auto-dark-mode')
      auto_dark_mode.setup()
      auto_dark_mode.init()
    end,
  },

  -- hop
  {
    'phaazon/hop.nvim',
    event = 'BufRead',
    config = function()
      require('hop').setup()
      vim.api.nvim_set_keymap(
        'n', '<leader>h', '<cmd>HopWord<cr>', { silent = true }
      )
      vim.api.nvim_set_keymap(
        'v', '<leader>h', '<cmd>HopWord<cr>', { silent = true }
      )
    end,
  },

  -- markdown-preview
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = 'markdown',
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- minimap
  {
    'wfxr/minimap.vim',
    config = function()
      vim.cmd('let g:minimap_auto_start = 1')
      vim.cmd('let g:minimap_auto_start_win_enter = 1')
      vim.cmd([[let g:minimap_cursor_color = 'TablineSel']])
      vim.cmd('let g:minimap_highlight_search = 1')
      vim.cmd([[let g:minimap_range_color = 'Tabline']])
      vim.cmd('let g:minimap_width = 10')
    end,
  },

  -- postcss
  { 'stephenway/postcss.vim' },

  -- postcss-syntax
  { 'alexlafroscia/postcss-syntax.vim' },

  -- spectre
  {
    'windwp/nvim-spectre',
    config = function()
      require('spectre').setup()
    end,
  },

  -- surround
  { 'tpope/vim-surround' },

  -- todo-comments
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    config = function()
      require('todo-comments').setup({
        highlight = {
          pattern = [[\@?(KEYWORDS)]],
        },
        search = {
          pattern = [[.*(KEYWORDS).*]],
        },
      })
    end,
  },

  -- trouble
  { 'folke/trouble.nvim', cmd = 'TroubleToggle' },

  -- visual-multi
  { 'mg979/vim-visual-multi' },
}

-- Autocommands
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.postcss' },
  command = 'set filetype=postcss',
})

-- Vim Config
vim.cmd 'source ~/.vimrc'
