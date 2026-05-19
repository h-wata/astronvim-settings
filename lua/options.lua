-- nvim 0.12 で vim.lsp.protocol._request_name_to_capability が
-- _request_name_to_server_capability にリネームされ、none-ls (client.lua:79) が
-- nil index して CursorMoved で illuminate 経由で連発エラーを出す問題の shim。
-- 本家が追従したら削除可。
if vim.lsp and vim.lsp.protocol and not vim.lsp.protocol._request_name_to_capability then
  vim.lsp.protocol._request_name_to_capability = vim.lsp.protocol._request_name_to_server_capability
end

-- n/N で移動したあと自動でzz
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- ESCでのみハイライト解除
vim.keymap.set('n', '<Esc>', function()
  if vim.fn.hlsearch() == 1 then
    vim.cmd('nohlsearch')
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  end
end, { noremap = true, silent = true })
