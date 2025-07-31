return {
  -- blink
  --  * Use <TAB> key for completion and snippets (supertab):
  --    https://cmp.saghen.dev/configuration/keymap#super-tab
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
    },
  },

  -- cursor * Make insert mode line cursor blink.
  {
    "rasulomaroff/cursor.nvim",
    event = "VeryLazy",
    opts = {
      cursors = {
        {
          mode = "i",
          blink = 100,
        },
      },
    },
  },

  -- snacks
  --  * Set a custom width on the file explorer:
  --    https://www.lazyvim.org/configuration/recipes#supertab
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 0.275,
              },
            },
          },
        },
      },
    },
  },

  -- vim-visual-multi * Add multiple cursors (sublime edit style).
  { "mg979/vim-visual-multi" },
}
