return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for Telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Optional extension
		"nvim-tree/nvim-web-devicons", -- Icons support
		"folke/todo-comments.nvim", -- Optional extension
		"nvim-telescope/telescope-file-browser.nvim", -- File Browser extension
		"nvim-telescope/telescope-live-grep-args.nvim", -- Live Grep with args for advanced functionality
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true, -- Use file browser instead of netrw
					mappings = {
						["i"] = {
							["<C-n>"] = require("telescope._extensions.file_browser.actions").create, -- Create new file
						},
						["n"] = {
							n = require("telescope._extensions.file_browser.actions").create, -- Create new file in normal mode
						},
					},
				},
				live_grep_args = {}, -- No additional config needed
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")

		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<D-k>", "<cmd>Telescope find_files<cr>", { desc = "Jump to any file in project" })

		-- Keybinding to open file browser relative to the current file
		keymap.set("n", "<D-n>", function()
			local current_file = vim.fn.expand("%:p:h") -- Get the directory of the current file
			require("telescope").extensions.file_browser.file_browser({ cwd = current_file })
		end, { desc = "Open Telescope File Browser relative to current file" })

		-- Keybinding for workspace-wide find and replace
		keymap.set("n", "<leader>fw", function()
			require("telescope").extensions.live_grep_args.live_grep_args({
				default_text = "",
			})
		end, { desc = "Workspace-wide find and replace" })
	end,
	lazy = false, -- Ensure it loads immediately
	priority = 1000, -- Optional: Ensures it loads before other plugins
}
