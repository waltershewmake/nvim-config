return {
  "stevanmilic/nvim-lspimport",
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>a", require("lspimport").import, { noremap = true })
  end
}
