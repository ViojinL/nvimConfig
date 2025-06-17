-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard:append { 'unnamedplus' }

if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'win32yank',
    copy = { ['+'] = 'win32yank.exe -i', ['*'] = 'win32yank.exe -i' },
    paste = { ['+'] = 'win32yank.exe -o', ['*'] = 'win32yank.exe -o' },
    cache_enabled = 0,
  }
end
