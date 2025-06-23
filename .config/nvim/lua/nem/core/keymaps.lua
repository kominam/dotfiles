vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>s", ":w<CR>", { desc = "Save current buffer" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit current buffer" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- Window movement
keymap.set("n", "<c-h>", "<c-w>h", { desc = "Move to left window" })
keymap.set("n", "<c-j>", "<c-w>j", { desc = "Move to down window" })
keymap.set("n", "<c-k>", "<c-w>k", { desc = "Move to top window" })
keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move to right window" })

keymap.set("n", "<esc>", ":noh<CR>", { desc = "No highlight search" })
