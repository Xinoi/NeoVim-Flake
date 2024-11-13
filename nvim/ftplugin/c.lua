local clangd_cmd = 'clangd'

if vim.fn.executable(clangd_cmd) ~= 1 then
  return
end

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'build',
  '.git',
}

vim.lsp.start {
  name = 'clangd',
  cmd = { clangd_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, {upward = true})[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
