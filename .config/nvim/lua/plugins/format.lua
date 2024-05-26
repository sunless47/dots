return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {

        -- good stuffs
        latex = { "latexindent" },
        markdown = { "mdformat", "markdownlint", "doctoc" },
        lua = { "stylua", "luaformatter" },
        bash = { "shfmt", "shellharden", "beautysh" },

        -- web dev
        javascript = { "prettier", "prettierd", "standardjs", "rustywind" },
        typescript = { "prettier", "prettierd", "ts-standard", "rustywind" },
        angular = { "rustywind", "prettierd", "prettier" },
        sql = { "sql-formatter" },
        json = { "fixjson" },

        -- programming
        python = { "black", "blackd-client", "isort" },
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
