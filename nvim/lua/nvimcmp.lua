-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup lspconfig ( enable Language clients )
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}
require'lspconfig'.tsserver.setup{
	capabilities = capabilities
}
require'lspconfig'.cmake.setup{
	capabilities = capabilities
}
require('lspconfig').clangd.setup {
  capabilities = capabilities
}
	-- cmd = {
	-- 	"clangd",
	-- 	"--background-index",
	-- 	"--suggest-missing-includes",
	-- 	"--clang-tidy",
	-- 	"-Wall",
	-- }
