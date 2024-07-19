return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local function has_file(filename)
			local f = io.open(filename, "r")
			if f ~= nil then
				io.close(f)
				return true
			else
				return false
			end
		end

		local formatters_by_ft = {
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
			svelte = { "biomejs" },
			css = { "biomejs" },
			html = { "biomejs" },
			json = { "biomejs" },
			yaml = { "biomejs" },
			markdown = { "biomejs" },
			graphql = { "biomejs" },
			liquid = { "biomejs" },
			lua = { "stylua" },
			python = { "isort", "black" },
		}

		if has_file(".eslintrc.cjs") or has_file(".eslintrc.json") then
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			}
		end

		conform.setup({
			formatters_by_ft = formatters_by_ft,
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
