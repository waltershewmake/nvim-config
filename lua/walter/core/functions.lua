
-- ~/.config/nvim/lua/utils/file_ops.lua
local M = {}

function M.create_file()
  local path = vim.fn.input("New file path: ", "", "file")
  if path ~= "" then
    vim.cmd("e " .. path)
    vim.cmd("write")
    vim.notify("Created file: " .. path, vim.log.levels.INFO)
  end
end

function M.create_folder()
  local path = vim.fn.input("New folder path: ", "", "dir")
  if path ~= "" then
    vim.fn.mkdir(path, "p")
    vim.notify("Created folder: " .. path, vim.log.levels.INFO)
  end
end

return M

