-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- aktifkan colorscheme bawaan delek setelah semua plugin dimuat
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.cmd("colorscheme blue")
  end,
})
