local filetype_exclude = { "NvimTree" }
vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
	pattern = filetype_exclude,
	callback = function()
		require('ufo').detach()
	end,
})

require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { 'treesitter' }
	end
})
