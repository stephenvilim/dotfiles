local wk = require("which-key")
local hop = require("hop")
local directions = require('hop.hint').HintDirection
wk.register({
  --
  --[[ KEY MAPPINGS ]]
  --  SINGLE KEYS:
  --    NOTE: a
  --    [count]a - insert after cursor [count] times
  --
  --    NOTE: b
  --    [count]b - go back count words
  --
  --    NOTE: c
  --    [reg]c[motion] - Delete [motion] text into [reg] and start insert
  --      [count][reg]cc - Delete [motion] text linewise into [reg] and start insert
  --
  --    NOTE: d
  --    [reg]d[motion] - Delete [motion] text into [reg]
  --      [reg][count]dd - delete [count] lines into [reg]
  --
  --    NOTE: e
  --    [count]e - forward to the end of word
  --
  --    NOTE: f
  --    [count]f[char] - go to [count] occurence of [char]
  --
  --    TODO: g
  --
  --    NOTE: h
  --    [count]h - go [count] character left
  --
  --    NOTE: i
  --    i - enter insert mode
  --
  --    NOTE: j
  --    [count]j - go [count] character down
  --
  --    NOTE: k
  --    [count]k - go [count] character up
  --
  --    NOTE: l
  --    [count]l - go [count] character right
  --
  --    NOTE: m
  --    k[char] - set mark for [char] at cursor
  --
  --    NOTE: n
  --    [count]n - repeat the latest "/" or "?" [count] times.
  --
  --    NOTE: o
  --    [count]o - begin a new line below the cursor and insert text
  --
  --    NOTE: p
  --    [count]k[reg] - put the text from [reg] after the cursor [count] times
  --
  --    NOTE: q
  --    q[char] - record into macro for [char]
  --
  --    NOTE: r
  --    [count]r[char] - replace [count] chars with [count] [char]
  --
  --    NOTE: s
  --    [count]s - hop to beginning of word
  --
  --    NOTE: t
  --    [count]t[char] - go to [count] occurence before [char]
  --
  --    NOTE: u
  --    [count]u - undo [count] changes
  --
  --    NOTE: v
  --    [count]v - visual mode
  --
  --    NOTE: w
  --    [count]w - [count] words forward
  --
  --    NOTE: x
  --    [count][reg]k - delete [count] character under and after cursor into [reg]
  --
  --    NOTE: y
  --    [reg]y[motion] - yank [motion] text into [reg]
  --      [count][reg]yy - yank [count] lines into [reg]
  --
  --    TODO: z
  --    NOTE: A
  --    [count]A - append at end of line [count] times
  --
  --  CAPITAL KEYS:
  --
  --
  --
  q = { "<cmd>feedkeys(\"q\")<CR>", "record macro" },








  w = { "<cmd>lua require('spider').motion('w')<CR>", "go forward word" },
  e = { "<cmd>lua require('spider').motion('e')<CR>", "go to end of word" },
  t = {
    function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end,
    "hop forward offset" },
  T = {
    function()
      hop.hint_char1(
        {
          direction = directions.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1
        })
    end,
    "hop backward offset" },

  --s = { function() hop.hint_words() end, "hop" },
  f = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end,
    "hop forward" },
  F = { function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end,
    "hop backward" },
  K = { vim.lsp.buf.hover, "hover" },
  [";"] = { ":", "command" },

  b = { "<cmd>lua require('spider').motion('b')<CR>", "go back word" },

  ["<C-e>"] = { "<cmd>Windows<cr>", "windows" },
  --<C-e>"] = redo,
  ["<C-y>"] = { "<cmd>Telescope commands<cr>", "commands" },
  --<C-u>"] = page up,
  --<C-i>"] = jump forward,
  --<C-o>"] = jump back,
  ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "files" },

  ["<C-a>"] = { "<cmd>Telescope registers<cr>", "registers" },
  ["<C-s>"] = { "<cmd>Telescope help_tags<cr>", "help tags" },
  --<C-d>"] = page down,
  ["<C-f>"] = { "<cmd>Telescope live_grep<cr>", "search" },
  ["<C-g>"] = { "<cmd>Telescope command_history<cr>", "search" },
  ["<C-h>"] = { "<C-w>h", "focus window left" },
  ["<C-j>"] = { "<C-w>j", "focus window down" },
  ["<C-k>"] = { "<C-w>k", "focus window up" },
  ["<C-l>"] = { "<C-w>l", "focus window right" },
  ["<C-;>"] = { "<cmd>NvimTreeToggle<cr>", "nvim tree" },
  ["<C-'>"] = { "<cmd>SymbolsOutline<cr>", "symbols outline" },

  ["<C-b>"] = { "<cmd>Telescope buffers<cr>", "buffers" },
  ["<C-n>"] = { "<cmd>Navbuddy<cr>", "navbuddy" },
  ["<C-m>"] = { "<cmd>Telescope marks<cr>", "marks" },

  ["<C-S-h>"] = { "<cmd>WinShift left<cr>", "move window left" },
  ["<C-S-j>"] = { "<cmd>WinShift down<cr>", "move window down" },
  ["<C-S-k>"] = { "<cmd>WinShift up<cr>", "move window up" },
  ["<C-S-l>"] = { "<cmd>WinShift right<cr>", "move window right" },
  ["<C-S-r>"] = { "<cmd>WinShift right<cr>", "move window right" },

  ["<cr>"] = { "za", "hover" },

  ["z"] = {
    R = { require('ufo').openAllFolds, "Open all folds" },
    M = { require('ufo').closeAllFolds, "Close all folds" }
  },

  ["<leader>"] = {
    l = {
      name = "lsp",
      w = { "<cmd>Telescope lsp>document_symbols<cr>", "<cmd>Telescope lsp>document_symbols<cr>" },
      i = { "<cmd>Telescope lsp_incoming_calls<cr>", "incoming calls" },
      o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "outgoing calls" },

      s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "dynamic workspace symbols" },
      d = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
    },
    k = { "<cmd>WhichKey<cr>", "WhichKey" },
  },

  g = {
    s = { "<cmd>lua require('spider').motion('ge')<CR>", "go to end of previous word" },
    e = { "<cmd>lua require('spider').motion('ge')<CR>", "go to end of previous word" },
    r = { "<cmd>Telescope lsp_references<cr>", "references" },
    i = { "<cmd>Telescope lsp_implementations<cr>", "implementations" },
    D = { "<cmd>Telescope lsp_definitions<cr>", "definitions" },
  },

  ["="] = {
    s = { "<cmd>Telescope git_status<cr>", "git status" },
    h = { "<cmd>Telescope git_stash<cr>", "git stash" },

    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    b = { "<cmd>Telescope git_branches<cr>", "git branches" },
  },
}, { silent = false })
