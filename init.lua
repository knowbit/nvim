require('plugins')
require('nvim-cmp')
require 'nvim-web-devicons'.get_icons()

require("neo-tree").setup({
  close_if_last_window = false,
  enable_diagnostics = true,
  enable_git_status = true,
  popup_border_style = "rounded",
  sort_case_insensitive = false,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  window = { width = 30 },
})

vim.cmd("colorscheme tokyonight-night")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.number = true

-- Всегда показывать вкладки
vim.opt.showtabline = 2

vim.opt.clipboard = 'unnamedplus'
-- Поддержка киридицы
vim.opt.keymap = 'russian-jcukenwin'
vim.opt.iminsert = 0
vim.opt.imsearch = 0

-- no swap
vim.opt.swapfile = false

vim.opt.mouse = 'a'

-- Give me space ( отступ не будет дергатся )
vim.opt.signcolumn = 'yes'

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- autocmd BufWritePre <buffer> lua vim.lsp.buf.format()

vim.opt.termguicolors = true

require("bufferline").setup()

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.keymap.set('n', '<space>e', ':Neotree toggle <enter>')
vim.keymap.set('n', ',<space>', ':nohl<CR>')

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true })

-- map('n', '<Tab>', ':tabNext<CR>', default_opts)

vim.keymap.set('n', '<space>w', ':w <CR>')
vim.keymap.set('n', '<space>c', ':bd <CR>')

vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', ':bprevious<CR>', { noremap = true, silent = true })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

require('treesetter')
