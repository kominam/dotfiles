local M = {}

function M.find_config()
  require("telescope.builtin").find_files({
    prompt_title = "Find in config",
    cwd = vim.fn.stdpath("config"),
    file_ignore_patterns = { "node_modules", ".git" },
  })
end

function M.project_files(opts)
  local _, builtin = pcall(require, "telescope.builtin")
  local ok = pcall(builtin.git_files, opts)

  if not ok then
    builtin.find_files(opts)
  end
end

return M
