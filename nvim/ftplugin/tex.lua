local texlab_cmd = 'texlab'

if vim.fn.executable(texlab_cmd) ~= 1 then
  return
end

local root_files = {
  '.texroot',     -- Common LaTeX root marker
  'main.tex',     -- Common main file name
  'root.tex',     -- Alternative root file
  '.latexmkrc',   -- LaTeX build configuration
  '.git',         -- Fallback to project root
}

vim.lsp.start {
  name = 'texlab',
  cmd = { texlab_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
