-- Author: Tarun (tarungovindk) nvim configs --
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- loads vscode style snippets from installed plugins (eg: friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()


-- Added this function to stop auto fill when pressing enter
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
    -- disable preselection by default
    preselect = 'none',
    completion={
        completeopt='menu,preview,menuone,noselect'
    },

	-- does require a snippet engine, else it will show an error
	-- get luasnip
	-- Not planning to use a snippet engine
	snippet = {
		expand = function(args)
		luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = {
		--["<C-k>"] = cmp.mapping.select_prev_item(),
		--["<C-j>"] = cmp.mapping.select_next_item(),
   	 	--["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
   	 	--["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		--["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
   	 	--["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
   	 	--["<C-e>"] = cmp.mapping {
		--	i = cmp.mapping.abort(),
		--	c = cmp.mapping.close(),
		--},
   		 -- Accept currently selected item. If none selected, `select` first item.
   		 -- Set `select` to `false` to only confirm explicitly selected items.
   		["<CR>"] = cmp.mapping.confirm { select = false },
		["<Tab>"] = cmp.mapping(
		function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {"i","s",}),
	
    	["<S-Tab>"] = cmp.mapping(
		function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
    	end, {"i","s",}),
	},
	sources = {
        --{ name = "supermaven" },
   		{ name = "nvim_lsp" },
        { name = "luasnip" },
   		{ name = "buffer" },
   		{ name = "path" },
	},
	--confirm_opts = {
	--	behavior = cmp.ConfirmBehavior.Replace,
	--	select = false,
	--},
	--window = {
	--	documentation = {
	--		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	--	},
	--},
	--experimental = {
	--	ghost_text = false,
	--	native_menu = false,
	--},
}

-- Setup lspconfig --.
-- The below line is depricated in cmp
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- pyright is not working in my machine for some reason
require('lspconfig')['jedi_language_server'].setup {
    capabilities = capabilities
}


-- Adding verible systemverilog language server
--require('lspconfig').verible.setup{
--  cmd = {'verible-verilog-ls'},
--}

