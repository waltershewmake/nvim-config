return {
  "loctvl842/monokai-pro.nvim",
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      transparent_background = true,
    })

    vim.cmd("colorscheme monokai-pro")
  end
}
