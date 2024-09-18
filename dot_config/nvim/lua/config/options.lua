local opt = vim.opt

opt.clipboard = "unnamedplus"          -- use system clipboard
opt.relativenumber = true              -- use relative line numbers
opt.number = true                      -- current line is absolute
opt.undofile = true                    -- save undo history through multiple sessions
opt.shiftwidth = 2                     -- pressing tab puts this many spaces instead
opt.expandtab = true                   -- expand tabs to spaces
opt.splitright = false                 -- vsplit right in stead of left
opt.splitbelow = true                  -- split down instead of up
opt.termguicolors = true

-- Disable providers unless required
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0
