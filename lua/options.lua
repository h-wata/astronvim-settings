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
