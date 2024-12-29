vim.g.mapleader = " "

local keymap = vim.keymap
local file_ops = require("walter.core.functions")

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Create a new file or folder
keymap.set("n", "<D-n>", file_ops.create_file, { desc = "Create a new file" })
keymap.set("n", "<D-M-n>", file_ops.create_folder, { desc = "Create a new folder" })

-- Move the current line or selected lines up
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", noremap = true, silent = true })
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true, silent = true })

-- Move the current line or selected lines down
keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", noremap = true, silent = true })
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", noremap = true, silent = true })

-- Code action
keymap.set("n", "<A-.>", vim.lsp.buf.code_action, { desc = "Open code actions" }) -- Normal mode
keymap.set("v", "<A-.>", vim.lsp.buf.code_action, { desc = "Open code actions (range)" }) -- Visual mode

-- Map Cmd+Backspace
keymap.set("i", "<D-BS>", "<C-u>", { noremap = true })
keymap.set("c", "<D-BS>", "<C-u>", { noremap = true })

-- Map Alt+Backspace
keymap.set("i", "<A-BS>", "<C-w>", { noremap = true })
keymap.set("c", "<A-BS>", "<C-w>", { noremap = true })
