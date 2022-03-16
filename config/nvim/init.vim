""" plugins

"" install

call plug#begin('~/.vim/plugged')

" dependencies
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'lithammer/nvim-diagnosticls'

" vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'

" others
Plug 'famiu/bufdelete.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ray-x/navigator.lua'
Plug 'overcache/NeoSolarized'
Plug 'windwp/nvim-spectre'
Plug 'lewis6991/spellsitter.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 's1n7ax/nvim-terminal'
Plug 'folke/trouble.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


"" configuration

" bufferline
lua << END
  require('bufferline').setup({
    options = {
      close_command = "Bdelete %d",
      diagnostics = 'nvim_lsp',
      right_mouse_command = "Bdelete %d",
      offsets = {
        {
          filetype = 'NvimTree',
          text = function()
            return vim.fn.get(vim.fn.split(vim.fn.getcwd(), '/'), -1)
          end,
          highlight = 'Directory',
          text_align = 'center'
        }
      },
    }
  })
END

" cmp
set completeopt=menu,menuone,noselect
lua << END
  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
    },
  })
  cmp.setup.filetype({ 'clap_input',  'guihua', 'guihua_rust' }, {
    completion = { autocomplete = false }
  })
END

" comment
lua require('Comment').setup({})

" hop
lua require('hop').setup({})

" indent-blankline
autocmd ColorScheme * 
  \ if &background == 'light'
  \ |   highlight IndentBlanklineChar guifg=#CCCCCC gui=nocombine
  \ | else
  \ |   highlight IndentBlanklineChar guifg=#333333 gui=nocombine
  \ | endif

" lualine
lua require('lualine').setup({})

" spellsitter 
lua require('spellsitter').setup({})

" terminal
lua require('nvim-terminal').setup({})

" tree
lua require('nvim-tree').setup({})

" treesitter
lua << END
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'css',
      'html',
      'javascript',
      'json',
      'markdown',
      'svelte',
      'typescript',
      'vim',
      'yaml',
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
END

" trouble
lua require("trouble").setup({})

" lsp + navigator (last)
lua << END
  require('navigator').setup({})
END



""" keybindings

nnoremap <leader>sv :source $MYVIMRC<CR>

" bufferline
nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>
nnoremap <silent>bm] :BufferLineMoveNext<CR>
nnoremap <silent>bm[ :BufferLineMovePrev<CR>
nnoremap <silent><leader>bd :Bdelete<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" hop
nnoremap <silent><leader>hc <Cmd>HopChar1<CR>
nnoremap <silent><leader>hd <Cmd>HopChar2<CR>
nnoremap <silent><leader>hl <Cmd>HopLine<CR>
nnoremap <silent><leader>hp <Cmd>HopPattern<CR>
nnoremap <silent><leader>hs <Cmd>HopLineStart<CR>
nnoremap <silent><leader>hw <Cmd>HopWord<CR>

" spectre
nnoremap <leader>fr <cmd>lua require('spectre').open()<CR>

" telescope
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>

" tree
nnoremap <leader>t :NvimTreeToggle<CR>

" trouble
nnoremap <leader>xx <cmd>TroubleToggle<CR>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<CR>
nnoremap <leader>xl <cmd>TroubleToggle loclist<CR>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<CR>
nnoremap <leader>xr <cmd>TroubleToggle lsp_references<CR>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<CR>



""" setup

" brew install gnu-sed ripgrep

" vimrc
source ~/.vimrc

" colors
set termguicolors
colorscheme NeoSolarized

" startup
"autocmd VimEnter * TroubleToggle
"autocmd VimEnter * NvimTreeOpen

