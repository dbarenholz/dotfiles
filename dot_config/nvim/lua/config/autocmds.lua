local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespaces from the end of lines when saving
-- TODO: don't do this for certain filetypes that care about those whitespaces?
autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Disable autoformat for hs files
autocmd({ "FileType" }, {
	pattern = { "hs" },
	callback = function()
		vim.b.autoformat = false
	end,
})

