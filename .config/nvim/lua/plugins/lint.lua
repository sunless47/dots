return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- other languages
      bash = { "shellcheck", "shellharden" },
      markdown = { "markdownlint", "textlint" },

      -- web dev languages
      html = { "htmlhint", "markuplint" },
      css = { "stylelint" },
      json = { "jsonlint" },
      javascript = { "quick-lint-js", "eslint_d", "standardjs" },
      typescript = { "quick-lint-js", "eslint_d", "ts-standard" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },

      -- programming languages
      lua = { "luacheck" },
      python = { "pylint" },
      django = { "djlint" },
      go = { "golangci-lint" },
      c = { "cpplint" },
      cpp = { "cpplint" },
      rust = { "cpptools" },
      sql = { "sqlfluff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
