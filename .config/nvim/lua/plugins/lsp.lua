return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"lua_ls",
					"ts_ls",
					"pyright",
					"yamlls",
					"jsonls",
					"eslint",
					"sqlls",
					"marksman",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")

			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				-- cmd = { "lua_ls" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' as a global variable
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			if not configs.ts_ls then
				configs.ts_ls = {
					default_config = {
						cmd = { "typescript-language-server", "--stdio" },
						capabilties = capabilities,
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"html",
						},
						root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
						-- single_file_support = true,
					},
				}
			end
			lspconfig.ts_ls.setup({
				-- capabilties = capabilities,
			})
			lspconfig.eslint.setup({
				capabilties = capabilities,
			})

			function get_python_path()
				-- Check if there's an active virtual environment
				local venv_path = os.getenv("VIRTUAL_ENV")
				if venv_path then
					return venv_path .. "/bin/python3"
				else
					-- get os name
					local os_name = require("utils").get_os()
					-- get os interpreter path
					if os_name == "windows" then
						return "C:/python312"
					elseif os_name == "linux" then
						return "/usr/bin/python3"
					else
						return "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"
					end
					-- Fallback to global Python interpreter
				end
			end

			lspconfig.pyright.setup({
				capabilties = capabilities,
				settings = {
					python = {
						pythonPath = get_python_path(),
						analysis = {
							typeCheckingMode = "strict", -- oder "basic", "off"
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			lspconfig.marksman.setup({
				capabilties = capabilities,
			})
		end,
	},
}
