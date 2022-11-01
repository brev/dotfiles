-- general
lvim.colorscheme = "catppuccin"
lvim.format_on_save = true
lvim.log.level = "warn"

-- core plugins (exit, reopen, :PackerInstall, :PackerCompile)
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- treesitter
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

-- formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
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
}

-- linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
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
}

-- keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.which_key.mappings["ss"] = {
  "<cmd>lua require \"spectre\".open()<cr>", "Search and Substitute"
}

-- extra plugins
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
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },

  -- trouble
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup({
        auto_open = true,
        auto_close = true,
      })
    end,
  },

  -- visual-multi
  { "mg979/vim-visual-multi" },
}

-- autocommands
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.postcss" },
  command = "set filetype=postcss",
})

-- vim config
vim.cmd "source ~/.vimrc"
