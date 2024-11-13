---Let neovim warn me if I set duplicate keymaps.
---This is copied from pseudometa's dotfiles: https://github.com/chrisgrieser/.config/blob/main/nvim/lua/config/leader-keybindings.lua
---@param modes string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? { unique: boolean, desc: string, buffer: boolean|number, nowait: boolean, remap: boolean }
function Keymap(modes, lhs, rhs, opts)
	if not opts then opts = {} end
	if opts.unique == nil then opts.unique = true end
	vim.keymap.set(modes, lhs, rhs, opts)
end

-- Set <Space> as leader
Keymap('n', " ", "<nop>", { silent = true, remap = false })
vim.g.mapleader = " "

------- Different keymaps for (n)vim keybindings ------------
vim.cmd.cnoreabbrev("W w")
vim.cmd.cnoreabbrev("Q q")
vim.cmd.cnoreabbrev("WQ wq")
vim.cmd.cnoreabbrev("Wq wq")

-- Disable help
Keymap('n', '<F1>', '<nop>')
Keymap('i', '<F1>', '<nop>')

-- Comment with C-/
Keymap('n', '<C-_>', 'gcc', { remap = true })
Keymap('v', '<C-_>', 'gc',  { remap = true })

-------- Plugin related keybindings ---------------

-- Diagnostics
Keymap('n', '<leader>e',  vim.diagnostic.open_float)  -- e  :: error
Keymap('n', '<leader>ld', vim.diagnostic.setloclist)  -- ld :: list diagnostics

-- LSPs
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, remap = false }
    -- TODO: do not set these mappings for Java projects, as nvim-java sets em for me.
    Keymap('n', 'gd', vim.lsp.buf.definition, opts)       -- gd :: goto def
    Keymap('n', 'gt', vim.lsp.buf.type_definition, opts)  -- gt :: goto type
    Keymap('n', 'gi', vim.lsp.buf.implementation, opts)   -- gi :: goto impl
    Keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- ca :: code action (expect error, nvim-java sets this to something silly)
  end,
})

-- Telescope: file and project navigation
Keymap('n', '<leader>ff', ':Telescope find_files<CR>',   { remap = false })  -- ff :: find files
Keymap('n', '<leader>fg', ':Telescope live_grep<CR>',    { remap = false })  -- fg :: find (by using) grep
Keymap('n', '<leader>fb', ':Telescope buffers<CR>',      { remap = false })  -- fb :: find buffers
Keymap('n', '<leader>ft', ':Telescope file_browser<CR>', { remap = false })  -- ft :: find (file) tree

-- Todos: list and jump between TODOs
Keymap('n', '<leader>lt', ':TodoTelescope<CR>', { desc = "Show all TODOs" })
Keymap('n', ']t', function()  require("todo-comments").jump_next()  end, { desc = "Next todo comment" })
Keymap('n', '[t', function()  require("todo-comments").jump_prev()  end, { desc = "Previous todo comment" })

-- ToggleTerm: toggle terminals
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]       , opts)
  vim.keymap.set('t', 'jk'   , [[<C-\><C-n>]]       , opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]]  , opts)
end
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
