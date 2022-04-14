""" setup

source ~/.vimrc



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
  Plug 'dense-analysis/ale'
  Plug 'famiu/bufdelete.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'phaazon/hop.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'yavko/minimap.nvim'
  Plug 'ray-x/navigator.lua'
  Plug 'overcache/NeoSolarized'
  Plug 'stephenway/postcss.vim'
  Plug 'windwp/nvim-spectre'
  Plug 'lewis6991/spellsitter.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 's1n7ax/nvim-terminal'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'folke/trouble.nvim'
  Plug 'tanvirtin/vgit.nvim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


"" configuration

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'html': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \   'json': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \   'typescript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \   'svelte': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \ }
let g:ale_linter_aliases = { 'svelte': ['svelte', 'javascript'] }
let g:ale_linters = { 'svelte': ['eslint', 'svelteserver'] }

" bufferline
lua << END
  require('bufferline').setup({
    options = {
      close_command = 'Bdelete %d',
      diagnostics = 'nvim_lsp',
      right_mouse_command = 'Bdelete %d',
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
      ['<tab>'] = cmp.mapping.confirm({ select = true }),
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

" devicons
lua << END
  require('nvim-web-devicons').setup({
    override = {
      postcss = {
        icon = '',
        color = '#563d7c',
        cterm_color = '60',
        name = 'PostCss',
      }
    }
  })
END

" hop
lua require('hop').setup({})

" lualine
lua require('lualine').setup({})

" minimap
let g:minimap_highlight_range = 1
let g:minimap_range_color = 'MinimapCustomRange'
autocmd BufRead,BufNewFile * Minimap
autocmd BufUnload * MinimapClose

" postcss
autocmd BufRead,BufNewFile *.postcss set filetype=postcss

" solarized
colorscheme NeoSolarized
autocmd ColorScheme *
  \ if &background == 'light'
  \ |   highlight IndentBlanklineChar guifg=#CCCCCC
  \ |   highlight MinimapCustomRange guibg=#CCCCCC
  \ | else
  \ |   highlight IndentBlanklineChar guifg=#333333
  \ |   highlight MinimapCustomRange guibg=#333333
  \ | endif

" spellsitter
lua require('spellsitter').setup({})

" terminal
lua require('nvim-terminal').setup({})

" tree
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
let g:nvim_tree_icons = {
  \   'default': '',
  \   'folder': {
  \     'arrow_open': '▽',
  \     'arrow_closed': '▷',
  \   },
  \ }
lua << END
  require('nvim-tree').setup({
    open_on_setup = true,
  })
END

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
lua << END
  require('trouble').setup({
    auto_open = true,
    auto_close = true,
  })
END

" vgit
lua require('vgit').setup({})

" lsp + navigator (last)
lua << END
  require('navigator').setup({
    lsp = {
      disable_lsp = { 'angularls', 'denols' },
    }
  })
END



""" keybindings

nnoremap <leader>sv <cmd>source $MYVIMRC<cr>

" bufferline
nnoremap <silent>b] <cmd>BufferLineCycleNext<cr>
nnoremap <silent>b[ <cmd>BufferLineCyclePrev<cr>
nnoremap <silent>bm] <cmd>BufferLineMoveNext<cr>
nnoremap <silent>bm[ <cmd>BufferLineMovePrev<cr>
nnoremap <silent><leader>bd <cmd>Bdelete<cr>
nnoremap <silent><leader>1 <cmd>BufferLineGoToBuffer 1<cr>
nnoremap <silent><leader>2 <cmd>BufferLineGoToBuffer 2<cr>
nnoremap <silent><leader>3 <cmd>BufferLineGoToBuffer 3<cr>
nnoremap <silent><leader>4 <cmd>BufferLineGoToBuffer 4<cr>
nnoremap <silent><leader>5 <cmd>BufferLineGoToBuffer 5<cr>
nnoremap <silent><leader>6 <cmd>BufferLineGoToBuffer 6<cr>
nnoremap <silent><leader>7 <cmd>BufferLineGoToBuffer 7<cr>
nnoremap <silent><leader>8 <cmd>BufferLineGoToBuffer 8<cr>
nnoremap <silent><leader>9 <cmd>BufferLineGoToBuffer 9<cr>

" hop
nnoremap <silent><leader>hc <cmd>HopChar1<cr>
nnoremap <silent><leader>hd <cmd>HopChar2<cr>
nnoremap <silent><leader>hl <cmd>HopLine<cr>
nnoremap <silent><leader>hp <cmd>HopPattern<cr>
nnoremap <silent><leader>hs <cmd>HopLineStart<cr>
nnoremap <silent><leader>hw <cmd>HopWord<cr>

" spectre
nnoremap <leader>fr <cmd>lua require('spectre').open()<cr>

" telescope
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" tree
nnoremap <leader>t <cmd>NvimTreeToggle<cr>

" trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xr <cmd>TroubleToggle lsp_references<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>

" vgit
nnoremap <leader>gda <cmd>VGit project_diff_preview<cr>
nnoremap <leader>gdb <cmd>VGit buffer_diff_preview<cr>
nnoremap <leader>gsa <cmd>VGit stage_all<cr>
nnoremap <leader>gsb <cmd>VGit buffer_stage<cr>
nnoremap <leader>gub <cmd>VGit buffer_unstage<cr>
