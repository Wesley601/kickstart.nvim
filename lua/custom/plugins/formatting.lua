local format_opts = {
	lsp_fallback = true,
	async = false,
	timeout_ms = 500,
}

return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require 'conform'

		conform.setup {
			formatters_by_ft = {
				javascript = { 'prettier' },
				typescript = { 'prettier' },
				javascriptreact = { 'prettier' },
				typescriptreact = { 'prettier' },
				css = { 'prettier' },
				html = { 'prettier' },
				json = { 'prettier' },
				yaml = { 'prettier' },
				markdown = { 'prettier' },
				graphql = { 'prettier' },
				lua = { 'stylua' },
				go = { 'gofumpt' },
			},
			format_on_save = format_opts,
		}

		vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
			conform.format(format_opts)
		end, { desc = 'Format file or range (in visual mode)' })
	end,
}
