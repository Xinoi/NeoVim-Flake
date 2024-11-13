local clangd_cmd = 'clangd'

if vim.fn.executable(clangd_cmd) ~= 1 then
  return
end

local root_files = {
  '.clangd'
}
