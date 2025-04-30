--  * LSP Formatters and Linters to be installed manually.
--  * @TODO: Markdown LSP (marksman gone)
--  * @TODO: i18n/l10n (plugin)
--  * @TODO: postcss (treesitter + lsp)

lvim.format_on_save = { enabled = true, timeout = 10000 } -- prettier

lvim.builtin.lualine.on_config_done = function(lualine)
	local config = lualine.get_config()
	local lsp = config.sections.lualine_x[2]
	lsp.fmt = function(str)
		return string.gsub(str, ",? ?trim_%a+", "")
	end
	lualine.setup(config)
end

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
	-- xml svg
	{
		command = "tidy",
		args = { "--input-xml", "true" },
		filetypes = { "xml", "svg" },
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
	-- postcss
	{ "stephenway/postcss.vim" },
	-- postcss-syntax
	{ "alexlafroscia/postcss-syntax.vim" },
}

-- Autocommands (nvim)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.postcss" },
	command = "set filetype=postcss",
})

https://github.com/Jezda1337/nvim-html-css

-- Base Config (vim)
vim.cmd("source ~/.vimrc")
