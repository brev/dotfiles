return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        width = 25,
        preset = {
          header = [[
                                                      
     ██ █████         ████     ██               
    ████████           ████                      
   █████████████ ██████████ █  ████████  
  ██████████ ████████████ ███ ██████████  
 ██████████ ████  ████████ ███ ████ ███ ███  
██████████    ███ ████████ ███ ████ ███ ███ 
████  █ ███████████████ ███ ███ ███ ███ ████]],
        },
        sections = {
          {
            section = "header",
            width = 56,
            indent = -16,
            -- section = "terminal",
            -- cmd = "lolcat ~/.config/nvim/static/header.txt",
            -- ttl = 0,
          },
          {
            section = "keys",
            padding = 2,
          },
          { section = "startup" },
        },
      },
    },
  },
}
