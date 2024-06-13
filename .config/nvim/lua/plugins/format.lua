return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {

				-- good stuffs
				latex = { "latexindent" },
				markdown = { "mdformat" },
				lua = { "stylua" },
				bash = { "shellharden" },

				-- web dev
				html = { "htmlbeautifier" },
				css = { "prettierd" },
				scss = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				angular = { "prettierd" },
				sql = { "sql-formatter" },
				json = { "fixjson" },

				-- programming
				python = { "blackd-client" },
				c = { "clang-format" },
				java = { "google-java-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
