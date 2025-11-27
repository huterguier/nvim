vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.clipboard = 'unnamedplus'
vim.opt.winborder = 'rounded'
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>so', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>%', ':vs<CR>')
vim.keymap.set('n', '<leader>"', ':sp<CR>')


vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

vim.pack.add({ 'https://github.com/christoomey/vim-tmux-navigator' })
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>')

vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require 'oil'.setup()
vim.keymap.set('n', '<leader>o', ':Oil<CR> --float')

vim.pack.add({ 'https://github.com/github/copilot.vim', })

vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed = { 'lua_ls', 'pyright' },
})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
require('nvim-treesitter.configs').setup({
	ensure_installed = { 'python', 'lua', 'typescript', 'javascript', 'html', 'css' },
	highlight = { enable = true },
})

vim.pack.add({
	{ src = 'https://github.com/nvim-telescope/telescope.nvim', tag = '0.1.9' },
	'https://github.com/nvim-lua/plenary.nvim'
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })

-- vim.pack.add({ 'https://github.com/vague2k/vague.nvim' })
-- require('vague').setup({
-- 	bold = false,
-- 	italic = false,
-- })
-- vim.cmd('colorscheme vague')

vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' })
vim.cmd('colorscheme tokyonight-night')

vim.pack.add({ 'https://github.com/stevearc/dressing.nvim' })
require("dressing").setup({
	input = { start_in_insert = false, insert_only = false, },
})

vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
require("conform").setup({
	formatters_by_ft = {
		python = { "isort", "black" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
