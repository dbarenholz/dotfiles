local opt = vim.opt
local o = vim.o
local autocmd = vim.api.nvim_create_autocmd


opt.clipboard = "unnamed,unnamedplus"  -- use system clipboard

opt.relativenumber = true              -- use relative line numbers
opt.number = true                      -- current line is absolute

opt.undofile = true                    -- save undo history through multiple sessions

opt.shiftwidth = 2                     -- pressing tab puts this many spaces instead
opt.expandtab = true                   -- expand tabs to spaces
o.tabsize = 8                        -- a \t character is 8 spaces

opt.splitright = false                 -- vsplit right in stead of left
opt.splitbelow = true                  -- split down instead of up

-- Remove whitespaces from the end of lines when saving
autocmd({ "BufWritePre" }, {
  pattern = {"*"},
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

