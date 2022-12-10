local s, bufferline = pcall(require, 'bufferline')
if (not s) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = "thin",
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#add7ff',
    },
    background = {
      fg = '#add7ff',
      bg = '#191724'
    },
    buffer_selected = {
      fg = '#5de4c7',
      bold = true
    },
  }
}

vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>tabnew<cr>', {})
vim.api.nvim_set_keymap('n', '<A-Tab>', '<cmd>tabclose<cr>', {})

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<C-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
--vim.api.nvim_set_keymap('n', '<S-Tab>', ":tabnew<CR>", {})
--vim.api.nvim_set_keymap('n', 'd<Tab>', ":tabclose<CR>", {})
