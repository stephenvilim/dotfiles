vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Refresh indent colors",
  callback = function()
    vim.cmd [[hi IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[hi IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[hi IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[hi IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[hi IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[hi IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
  end,
})

vim.opt.list = true
--[[ vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴" ]]

require("indent_blankline").setup {
  max_indent_increase = 1,
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}
