return {
  {
    "catppuccin/nvim",
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
        -- dark = "mocha",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    config = function()
      local auto_dark_mode = require("auto-dark-mode")
      auto_dark_mode.setup()
      auto_dark_mode.init()
    end,
  },
}
