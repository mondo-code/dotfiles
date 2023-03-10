local lsp = require('lsp-zero')
lsp.preset("recommended")

lsp.configure('tsserver', {
	on_attach = function(client, bufnr)
		print('hello tsserver')
	end,
	settings = {
		completions = {
			completeFunctionCalls = true
		}
	}
})

lsp.configure('jdtls', {
  on_attach = function(client, bufnr)
    print('hello jdtls')
  end
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})
