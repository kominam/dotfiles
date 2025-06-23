return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  config = function()
    local conform = require("conform")

    conform.setup({
      format_on_save = function(bufnr)
        -- Don't format nvim-tree buffer
        if vim.bo[bufnr].filetype == "NvimTree" then
          return
        end
        return {
          lsp_fallback = true,
          timeout_ms = 1000,
          async = false,
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },    -- Use stylua for Lua files
        javascript = { "prettier" },  -- Use prettier for JavaScript files
        typescript = { "prettier" },  -- Use prettier for TypeScript files
        python = { "black" },  -- Use black for Python files
        typescriptreact = { "prettier" },
        css = { "prettier" },  -- Use prettier for CSS files
        json = { "prettier" },  -- Use prettier for JSON files
        yaml = { "prettier" },  -- Use prettier for YAML files
        markdown = { "prettier" },  -- Use prettier for Markdown files
        ruby = { "rubocop" },  -- Use rubocop for Ruby files
        -- go = { "gofumpt" },    -- Use gofumpt for Go
        go = { "goimports", "gofmt" },
      },
    })
  end
}
