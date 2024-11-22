return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config=true,
  keys= {
    {"<leader>td","<cmd>ToggleTerm size=40 dir=~/Desktop direction=horizontal<cr>",desc="Open a Terminal at the Desktop"},
    {"<leader>tt","<cmd>ToggleTerm direction=float<cr>",desc="Open a Terminal"}
  }
}
