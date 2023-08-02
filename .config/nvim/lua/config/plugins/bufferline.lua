require 'bufferline'.setup({
	options = {
		always_show_bufferline = false,
		themable = true,
		numbers = "buffer_id",
		padding = 0,
		close_command = 'Bdelete! %d',
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. " )"
		end,
		right_mouse_command = 'Bdelete! %d',
		left_mouse_command = 'buffer %d',
		middle_mouse_command = nil,
		indicator = {
			style = 'underline',
			icon = '', --'▎',
		},
		buffer_close_icon = ' ',
		modified_icon = '●',
		close_icon = ' ',
		left_trunc_marker = '<-', --'',
		right_trunc_marker = '->', --'',
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", padding = 1 } },
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		--show_buffer_default_icon = true,
		show_close_icon = false,
		show_tab_indicators = false,
		persist_buffer_sort = true,
		separator_style = "slant",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = 'id',
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
				end
				return result
			end,
		}
	},
})
