return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#111413',
				base01 = '#111413',
				base02 = '#7d8785',
				base03 = '#7d8785',
				base04 = '#cddad8',
				base05 = '#f8fffd',
				base06 = '#f8fffd',
				base07 = '#f8fffd',
				base08 = '#ffbf9f',
				base09 = '#ffbf9f',
				base0A = '#b6e4dd',
				base0B = '#a2f9a7',
				base0C = '#e3fffa',
				base0D = '#b6e4dd',
				base0E = '#d4fff8',
				base0F = '#d4fff8',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#7d8785',
				fg = '#f8fffd',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#b6e4dd',
				fg = '#111413',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7d8785' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#e3fffa', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#d4fff8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#b6e4dd',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#b6e4dd',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#e3fffa',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a2f9a7',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#cddad8' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#cddad8' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#7d8785',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
