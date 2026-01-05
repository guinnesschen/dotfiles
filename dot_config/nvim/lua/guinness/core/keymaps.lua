vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("v", ">", ">gv", { noremap = true, silent = true })
keymap.set("v", "<", "<gv", { noremap = true, silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

keymap.set("n", "<MiddleMouse>", "gd", { desc = "Go to definition" })
