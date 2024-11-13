local pyright_cmd = 'pyright-langserver'

if vim.fn.executable(pyright_cmd) ~= 1 then
  return
end

local root_files = {
   'pyrightconfig.json',
   '.git',
   'setup.py',
   'setup.cfg',
   'pyproject.toml',
   'requirements.txt',
   '.venv',
}

vim.lsp.start {
  name = 'pyright',
  cmd = {pyright_cmd, '--stdio'},
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    python= {
      analysis = {
        typeCheckingMode = 'basic',
      },
    },
  },
}
