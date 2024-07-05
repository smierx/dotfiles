return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
        "ruff_lsp",
        "pyright"
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})
    require("lspconfig").pyright.setup({
                settings = {
                    pyright = {
                        disableOrganizeImports = true, -- Will use ruff instead
                    },
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            autoImportCompletions = true,
                            diagnosticMode = "openFilesOnly", -- Use "workspace" if you like but may be slow
                            typeCheckingMode = "basic",   -- Using Mypy instead, it's better
                            pythonPath = "python",        -- gets replaced below
                        }
                    },
                },
                before_init = function(_, config)
                    local penv = require("util").python_env({
                        patterns = { "venv", ".venv", "env", ".env", ".eddie-venv" }
                    })
                    if penv == nil then
                        return
                    end
                    config.settings.python.pythonPath = penv.python
                end,
                capabilities = capabilities,
            })
    require('lspconfig').ruff_lsp.setup {
-- Handled by Pyright
                on_attach = function(client, _)
                    client.server_capabilities.hoverProvider = false
                end,
                commands = {
                    RuffOrganizeImports = {
                      function()
                        vim.lsp.buf.execute_command {
                          command = 'ruff.applyAutofix',
                          arguments = { { uri = vim.uri_from_bufnr(0) } },
                        }
                      end,
                      description = 'Ruff: Fix all auto-fixable problems',
                    },
                },
                capabilities = capabilities,
      init_options = {
        settings = {
          -- Any extra CLI arguments for `ruff` go here.
          args = {"--config=./pyproject.toml"},
        }
      }
    }
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
