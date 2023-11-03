vim.o.clipboard = "unnamed,unnamedplus"  -- use system clipboard

vim.o.relativenumber = true  -- use relative line numbers            
vim.o.number = true          -- current line is absolute

vim.o.undofile = true    -- save undo history through multiple sessions

vim.o.shiftwidth = 2     -- pressing tab puts this many spaces instead
vim.o.expandtabs = true  -- expand tabs to spaces
vim.o.tabsize = 8        -- a \t character is 8 spaces

vim.o.textwidth = 80     -- limit column at 80 characters
vim.o.colorcolumn = '+1' -- highlight when you go over 80
vim.cmd.highlight(       -- show black column add color column
 { "ColorColumn", "ctermbg=black" }
)

