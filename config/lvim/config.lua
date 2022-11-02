-- let g:nvim_tree_icons = {
--   \   "default": "",
--   \   "folder": {
--   \     "arrow_open": "▽",
--   \     "arrow_closed": "▷",
--   \   },
--   \ }

-- Put cursor over URL in text, and press `gx` to open.

-- General
lvim.colorscheme = "catppuccin"
lvim.format_on_save = true
lvim.log.level = "warn"

-- Core Plugins (restart, :PackerInstall, :PackerCompile, restart)
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.gitsigns.opts.signs.delete.text = lvim.icons.ui.BoldLineLeft
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Keymappings (restart, :PackerInstall, :PackerCompile, restart)
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.which_key.mappings.b.b = nil
lvim.builtin.which_key.mappings.b.h = {
  "<cmd>BufferLineCyclePrev<cr>", "Previous"
}
lvim.builtin.which_key.mappings.b.l = {
  "<cmd>BufferLineCycleNext<cr>", "Next"
}
lvim.builtin.which_key.mappings.b.m = {
  name = "Move",
  h = {
    "<cmd>BufferLineMovePrev<cr>", "Previous"
  },
  l = {
    "<cmd>BufferLineMoveNext<cr>", "Next"
  },
}
lvim.builtin.which_key.mappings.b.n = nil
lvim.builtin.which_key.mappings.g.S = {
  "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer"
}
lvim.builtin.which_key.mappings.s.F = {
  "<cmd>Telescope oldfiles<cr>", "Open Recent File"
}
lvim.builtin.which_key.mappings.s.r = {
  "<cmd>lua require(\"spectre\").open()<cr>", "Search and Replace"
}

-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "css",
  "dockerfile",
  "gitattributes",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "svelte",
  "typescript",
  "vim",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "beautysh" },
  {
    command = "prettierd",
    filetypes = {
      "css",
      "html",
      "javascript",
      "json",
      "markdown",
      "postcss",
      "svelte",
      "typescript",
      "yaml"
    },
  },
  { command = "trim_newlines" },
  { command = "trim_whitespace" },
  { command = "xmllint" },
})

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "eslint_d",
    filetypes = { "javascript", "svelte", "typescript" },
  },
  { command = "hadolint" },
  { command = "jsonlint" },
  { command = "luacheck" },
  { command = "markdownlint" },
  { command = "shellcheck" },
  {
    command = "stylelint",
    filetypes = { "css", "postcss" },
  },
  { command = "yamllint" },
  { command = "zsh" },
})

-- Extra Plugins
lvim.plugins = {
  -- catppuccin
  { "catppuccin/nvim", as = "catppuccin" },

  -- dark-mode
  {
    "f-person/auto-dark-mode.nvim",
    config = function()
      local auto_dark_mode = require("auto-dark-mode")
      auto_dark_mode.setup()
      auto_dark_mode.init()
    end,
  },

  -- markdown-preview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- postcss
  { "stephenway/postcss.vim" },

  -- postcss-syntax
  { "alexlafroscia/postcss-syntax.vim" },

  -- spectre
  {
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
  },

  -- todo-comments
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup({
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
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup({
        auto_close = true,
        auto_open = true,
      })
    end,
  },

  -- visual-multi
  { "mg979/vim-visual-multi" },
}

-- Autocommands
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.postcss" },
  command = "set filetype=postcss",
})

-- Vim Config
vim.cmd "source ~/.vimrc"
