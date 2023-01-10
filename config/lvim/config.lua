-- LunarVim Config
--  * Changes? => Restart, :PackerInstall, :PackerCompile, Restart.
--  * LSP Formatters and Linters to be installed manually.
--  * @TODO: i18n/l10n (plugin)
--  * @TODO: postcss (treesitter + lsp)

-- General Settings
lvim.colorscheme = "catppuccin"
lvim.format_on_save = { enabled = true, timeout = 10000 } -- prettier
lvim.log.level = "warn"

-- Core Plugin Settings
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.gitsigns.opts.signs.delete.text = lvim.icons.ui.BoldLineLeft
lvim.builtin.indentlines.options.show_current_context = false
lvim.builtin.lualine.on_config_done = function(lualine)
	local config = lualine.get_config()
	local lsp = config.sections.lualine_x[2]
	lsp.fmt = function(str)
		return string.gsub(str, ",? ?trim_%a+", "")
	end
	lualine.setup(config)
end
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons = {
	glyphs = {
		folder = {
			arrow_open = "▽",
			arrow_closed = "▷",
		},
	},
	show = { git = false },
}
lvim.builtin.treesitter.highlight.enabled = true

-- Treesitters (treesitter)
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"css",
	"dockerfile",
	"gitattributes",
	"gitignore",
	"html",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"markdown",
	"svelte",
	"toml",
	"typescript",
	"vim",
	"yaml",
}

-- Custom Language Servers (lsp + mason)
local manager = require("lvim.lsp.manager")
-- servers
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
	"marksman",
	"tailwindcss",
	"taplo",
}, _, _)
-- markdown
manager.setup("marksman", { filetypes = { "markdown" } })
-- toml
manager.setup("taplo", { filetypes = { "toml" } })

-- Formatters (lsp + null-ls)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- *
	{ command = "trim_newlines" },
	{ command = "trim_whitespace" },
	-- bash sh zsh
	{ command = "shfmt" },
	-- css json md html js postcss svelte ts yaml
	{
		command = "prettier", -- prettierd
		filetypes = {
			"css",
			"json",
			"markdown",
			"html",
			"javascript",
			"postcss",
			"svelte",
			"typescript",
			"yaml",
		},
	},
	-- lua
	{ command = "stylua" },
	-- toml
	{ command = "taplo" },
	-- xml
	{
		command = "tidy",
		args = { "--input-xml", "true" },
		filetypes = { "xml" },
	},
})

-- Linters (lsp + null-ls)
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- bash sh zsh
	{ command = "shellcheck" },
	-- css postcss
	{ command = "stylelint", filetypes = { "css", "postcss" } },
	-- Dockerfile
	{ command = "hadolint" },
	-- html
	{ command = "tidy", filetypes = { "html" } },
	-- js svelte ts
	{
		command = "eslint_d",
		filetypes = { "javascript", "svelte", "typescript" },
	},
	-- json
	{ command = "jsonlint" },
	-- lua
	{ command = "luacheck", args = { "--globals", "lvim,vim" } },
	-- md
	{ command = "markdownlint" },
	-- vim
	{ command = "vint", args = { "--enable-neovim" } },
	-- xml
	{
		command = "tidy",
		args = { "--input-xml", "true" },
		filetypes = { "xml" },
	},
	-- yaml
	{ command = "yamllint" },
})

-- Extra Plugins (packer)
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
	-- hop
	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>HopWord<cr>", { silent = true })
			vim.api.nvim_set_keymap("v", "<leader>h", "<cmd>HopWord<cr>", { silent = true })
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
	-- minimap
	-- {
	-- 	"wfxr/minimap.vim",
	-- 	config = function()
	-- 		vim.cmd("let g:minimap_auto_start = 1")
	-- 		vim.cmd("let g:minimap_auto_start_win_enter = 1")
	-- 		vim.cmd("let g:minimap_close_filetypes = ['alpha']")
	-- 		vim.cmd("let g:minimap_cursor_color = 'TablineSel'")
	-- 		vim.cmd("let g:minimap_highlight_search = 1")
	-- 		vim.cmd("let g:minimap_range_color = 'Tabline'")
	-- 		vim.cmd("let g:minimap_width = 10")
	-- 	end,
	-- },
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
	-- surround
	{ "tpope/vim-surround" },
	-- trouble
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	-- visual-multi
	{ "mg979/vim-visual-multi" },
}

-- Keymappings (which-key)
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.which_key.mappings.b.b = nil
lvim.builtin.which_key.mappings.b.h = {
	"<cmd>BufferLineCyclePrev<cr>",
	"Previous",
}
lvim.builtin.which_key.mappings.b.l = { "<cmd>BufferLineCycleNext<cr>", "Next" }
lvim.builtin.which_key.mappings.b.m = {
	name = "Move",
	h = { "<cmd>BufferLineMovePrev<cr>", "Previous" },
	l = { "<cmd>BufferLineMoveNext<cr>", "Next" },
}
lvim.builtin.which_key.mappings.b.n = nil
lvim.builtin.which_key.mappings.g.S = {
	"<cmd>Gitsigns stage_buffer<cr>",
	"Stage Buffer",
}
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.n = {
	"<cmd>nohlsearch<cr>:call minimap#vim#ClearColorSearch()<cr>",
	"No Highlight",
}
lvim.builtin.which_key.mappings.s.F = {
	"<cmd>Telescope oldfiles<cr>",
	"Open Recent File",
}
lvim.builtin.which_key.mappings.s.r = {
	"<cmd>lua require('spectre').open()<cr>",
	"and Replace",
}
lvim.builtin.which_key.mappings.t = {
	name = "Diagnostics",
	t = { "<cmd>TroubleToggle<cr>", "Trouble" },
	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
	d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
	l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
	r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}

-- Autocommands (nvim)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.postcss" },
	command = "set filetype=postcss",
})

-- Base Config (vim)
vim.cmd("source ~/.vimrc")
