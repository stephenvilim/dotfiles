local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--global configs
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ",  -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
}

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        --"sainnhe/sonokai",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme tokyonight-day]])
            require("tokyonight").setup({
                style = "day",
                styles = {
                    comments = { italic = true },
                    sidebars = "dark"
                },
                light_style = "day",
                day_brightness = 0.2,
                dim_inactive = false,
                on_highlights = function(hl, c)
                    hl.WinSeparator = {
                        fg = c.dark3
                    }
                end
            })

            -- load the colorscheme here
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                disable_netrw = true,
                view = {
                    signcolumn = "no",
                    width = {
                        padding = 4
                    }
                },
                renderer = {
                    highlight_git = true,
                    indent_width = 0,
                    indent_markers = {
                        inline_arrows = false,
                        enable = true
                    }
                }
            }
        end,
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require 'bufferline'.setup({
                options = {
                    always_show_bufferline = false,
                    themable = true,
                    numbers = "buffer_id",
                    padding = 0,
                    close_command = 'Bdelete! %d',
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        return "(" .. count .. " )"
                    end,
                    right_mouse_command = 'Bdelete! %d',
                    left_mouse_command = 'buffer %d',
                    middle_mouse_command = nil,
                    indicator = {
                        style = 'underline',
                        icon = '', --'▎',
                    },
                    buffer_close_icon = ' ',
                    modified_icon = '●',
                    close_icon = ' ',
                    left_trunc_marker = '<-',  --'',
                    right_trunc_marker = '->', --'',
                    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", padding = 1 } },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = false,
                    --show_buffer_default_icon = true,
                    show_close_icon = false,
                    show_tab_indicators = false,
                    persist_buffer_sort = true,
                    separator_style = "slant",
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    sort_by = 'id',
                    custom_areas = {
                        right = function()
                            local result = {}
                            local seve = vim.diagnostic.severity
                            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                            if error ~= 0 then
                                table.insert(result, { text = "  " .. error, fg = "#EC5241" })
                            end

                            if warning ~= 0 then
                                table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
                            end

                            if hint ~= 0 then
                                table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
                            end

                            if info ~= 0 then
                                table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
                            end
                            return result
                        end,
                    }
                },
            })
        end
    },
    {
        "levouh/tint.nvim",
        config = function()
            require("tint").setup({
                tint = -10,
                tint_background_colors = true, -- Tint background portions of highlight groups
                highlight_ignore_patterns = {},
            })
        end
    },
    {
        "junegunn/fzf",
        config = function()
            vim.cmd "let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-g']"
        end
    },
    {
        "junegunn/fzf.vim"
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = require('telescope.actions').move_selection_next,
                            ["<C-k>"] = require('telescope.actions').move_selection_previous,
                            ["<esc>"] = require('telescope.actions').close,
                        },
                        n = {
                            ["<C-j>"] = require('telescope.actions').move_selection_next,
                            ["<C-k>"] = require('telescope.actions').move_selection_previous,
                            ["j"] = require('telescope.actions').preview_scrolling_down,
                            ["k"] = require('telescope.actions').preview_scrolling_up
                        }
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                },
            })
            require('telescope').load_extension('fzf')
        end
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "cmp-cmdline" },
                    { name = "nvim_lsp_signature_help" },
                    { name = 'luasnip' },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
                    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },

            })
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            vim.keymap.set({ "i" }, "<C-J>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end
    },
    {
        "saadparwaiz1/cmp_luasnip"
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    {
        "hrsh7th/cmp-cmdline"
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    --[[ {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinNew" },
    }, ]]
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
        }
    },




    {
        "nvimdev/dashboard-nvim",
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "phaazon/hop.nvim",
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'jfkdlshgeiruwoqpzxcvbnm' }
        end
    },
    {
        "mfussenegger/nvim-dap"
    },
    {
        "nvim-treesitter/nvim-treesitter"
    },
    {
        "luochen1990/rainbow"
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup()
        end
    },
    {
        "neovim/nvim-lspconfig"
    },
    --[[ {
        "antosha417/nvim-lsp-file-operations",
    },
    {
        "ThePrimeagen/harpoon"
    },
    {
        "gennaro-tedesco/nvim-peekup"
    },
    {
        "Bekaboo/dropbar.nvim"
    },
    {
        "SmiteshP/nvim-navbuddy"
    },
    {
        "folke/twilight.nvim",
    },
    {
        "folke/zen-mode.nvim"
    },
    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end
    },
    {
        "voldikss/vim-floaterm"
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    },
    {
        "https://github.com/machakann/vim-sandwich"
    },
    {
        "rcarriga/nvim-notify"
    },
    {
        "liuchengxu/vista.vim"
    },
    {
        "simnalamburt/vim-mundo"
    },
    {
        "glacambre/firenvim"
    },
    {
        "kevinhwang91/nvim-bqf"
    },
    {
        "gelguy/wilder.nvim"
    },
    {
        "folke/which-key.nvim"
    },
    {
        "skywind3000/asyncrun.vim"
    }
    ]]
}, opts)

-- auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[set signcolumn=yes]]


local map = vim.keymap.set

----------------------------------
--MAPPINGS------------------------
----------------------------------

map("n", "<C-q>", "<cmd>Commits<cr>")
--p("n", "<C-w", "windows")
map("n", "<C-e>", "<cmd>Windows<cr>")
--p("n", "<C-r", "redo")
map("n", "<C-t>", "<cmd>FloatermNew<cr>")
map("n", "<C-y>", "<cmd>lua require('telescope.builtin').commands()<cr>")
--p("n", "<C-u", "page up")
--p("n", "<C-i", "jump forward")
--p("n", "<C-o", "jump back")
map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")

map("n", "<C-a>", "<cmd>lua require('telescope.builtin').registers()<cr>")
map("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<C-s>", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

map("n", "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n", "<C-m>", "<cmd>lua require('telescope.builtin').marks()<cr>")

map("n", "<C-S-r>", "<cmd>lua require('telescope.builtin').command_history()<cr>")
map("n", "<C-S-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>")
map("n", ";", ":")


-- leader leading character
map("n", "<leader>i", "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>")
map("n", "<leader>o", "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>")
map("n", "<leader>w", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")

map("n", "<leader>s", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
map("n", "<leader>d", "<cmd>lua require('telescope.builtin').diagnostics()<cr>")


-- g leading character
map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
map("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")

map("n", "gD", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")

-- = leading character
map("n", "=s", "<cmd>lua require('telescope.builtin').git_status()<cr>")
map("n", "=h", "<cmd>lua require('telescope.builtin').git_stash()<cr>")

map("n", "=c", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
map("n", "=b", "<cmd>lua require('telescope.builtin').git_branches()<cr>")

-- HOP MAPPINGS
local hop = require('hop')
local directions = require('hop.hint').HintDirection
map('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
map('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
map('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
map('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
map('', 's', function()
    hop.hint_words()
end, { remap = true })
-- map("n", "<C-k>", "<cmd>Buffers<cr>")

----------------------------------
-- OPTIONS -----------------------
----------------------------------
--
local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
--map("n", "gD", vim.lsp.buf.definition)
map("n", "K", vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gds", vim.lsp.buf.document_symbol)
map("n", "gws", vim.lsp.buf.workspace_symbol)
map("n", "<leader>cl", vim.lsp.codelens.run)
map("n", "<leader>sh", vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "<leader>ws", function()
    require("metals").hover_worksheet()
end)

-- all workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
map("n", "<leader>ae", function()
    vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
end)

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
map("n", "<leader>dc", function()
    require("dap").continue()
end)

map("n", "<leader>dr", function()
    require("dap").repl.toggle()
end)

map("n", "<leader>dK", function()
    require("dap.ui.widgets").hover()
end)

map("n", "<leader>dt", function()
    require("dap").toggle_breakpoint()
end)

map("n", "<leader>dso", function()
    require("dap").step_over()
end)

map("n", "<leader>dsi", function()
    require("dap").step_into()
end)

map("n", "<leader>dl", function()
    require("dap").run_last()
end)

-- LSP setups
require 'lspconfig'.ocamllsp.setup {}
require 'lspconfig'.hls.setup {}
require 'lspconfig'.lua_ls.setup {
    runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
    },
    diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
    },
    workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
        enable = false,
    },
}



-- THEMING


-- treesitter settings
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "scala" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- completion related settings
-- This is similiar to what I use

----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Debug settings if you're using nvim-dap
local dap = require("dap")

dap.configurations.scala = {
    {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
        },
    },
    {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
            runType = "testTarget",
        },
    },
}

metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { "scala", "sbt", "java" },
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})

--https://github.com/dandavison/delta
--https://github.com/sharkdp/bat
--https://github.com/BurntSushi/ripgrep
--https://github.com/sharkdp/fd
