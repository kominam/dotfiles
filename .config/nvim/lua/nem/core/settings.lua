local default = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10, -- pop up menu height
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true, -- set term gui colors
  expandtab = true,
  smartindent = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  laststatus = 3,
  hidden = true,
  undofile = true,
  previewheight = 5,
  wildignore = { "*/tmp/*", "*/node_modules/*", "*.so", "*.swp", "*.zip" }
}
-- vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"

vim.api.nvim_create_autocmd('BufWritePre', { pattern = '*', command = [[:%s/\s\+$//e]] })

for k, v in pairs(default) do
  vim.opt[k] = v
end
