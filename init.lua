local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

_G.P = function(...)
    print(type(...))
    if type(...) == "table" then
        vim.pretty_print(vim.inspect(...))
    else
        vim.pretty_print(vim.inspect({ ... }))
    end
    return ...
end

_G.RR = function(pkg_name)
    require("plenary.reload").reload_module(pkg_name)
    return require(pkg_name)
end

_G.R = function(module)
    for name, _ in pairs(package.loaded) do
        if name:match("^" .. module) then
            package.loaded[name] = nil
        end
    end
    require(module)
end


vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt
local cache_dir = vim.env.HOME .. '/.cache/nvim/'

opt.termguicolors = true
opt.hidden = true
opt.magic = true
opt.clipboard = 'unnamedplus'
opt.wildignorecase = true
opt.swapfile = false
opt.undodir = cache_dir .. 'undo/'
opt.history = 2000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 400
opt.ttimeoutlen = 10
opt.updatetime = 150
opt.redrawtime = 500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
opt.completeopt = 'menu,menuone,noselect'
opt.showmode = false
opt.scrolloff = 11
opt.ruler = false

opt.ruler = false
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 15
opt.showcmd = false

opt.cmdheight = 0
opt.laststatus = 3
opt.list = true
opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
opt.pumblend = 10
opt.winblend = 10
opt.undofile = true

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.diffopt:append('linematch:50')

opt.linebreak = true
opt.whichwrap = 'h,l,<,>,[,],~'
opt.breakindentopt = 'shift:2,min:20'
vim.wo.showbreak = 'NONE'

opt.foldlevelstart = 99
opt.foldmethod = 'marker'
opt.number = true
opt.signcolumn = 'yes'

opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
opt.splitkeep = "screen"
-- opt.statusline = '%#search# %n %#statusline# %f%r%m %= %w%y %l:%c %p%% '
local api = vim.api
local map = vim.keymap.set

map("n", 'f', "<cmd>HopWordAC<cr>")
map("n", 'F', "<cmd>HopWordBC<cr>")

map("n", "<Leader>lf", vim.lsp.buf.format)

map("n", "<leader>la", "<cmd>GetAllClasses<cr>")
map("n", "<leader>lc", "<cmd>GetClass<cr>")
map("n", "<leader>ls", "<cmd>SortClass<cr>")

map("n", "<leader>gg", "<cmd>GoBlade<cr>")
map("n", "<Leader>u", ":UndotreeToggle<CR>")


map("t", "<Esc>", "<C-\\><C-n>")
map('n', ';;', ':Lspsaga term_toggle<cr>')
map('t', ';;', '<C-\\><C-n>:Lspsaga term_toggle<cr>')

map("n", "<esc>", "<cmd>noh<cr><esc>")

map('n', '<leader>kk', ":%bd|e#|bd#<cr>", { silent = true })

map("n", "<C-d>", "7jzz")
map("n", "<C-f>", "7kzz")
map("n", "<C-i>", "<C-i>zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "<S-[>", "<S-[>zz")
map("n", "<S-]>", "<S-]>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

map("n", "G", "Gzz")
map("n", "H", "^")
map("n", "L", "$")

map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>wall<cr><esc>")

map("n", "<leader>cc", "<cmd>cclose<cr>")
map("n", "<leader>ld", "<cmd>bdelete<cr>")
map("n", "<leader>l;", "<cmd>w<cr><cmd>luafile %<cr>")
map("n", "<leader>lt", "<cmd>TSPlaygroundToggle<cr>")
map("n", "<Tab>", "<cmd>bn<cr>")
map("n", "<S-Tab>", "<cmd>bp<cr>")
map("n", "<leader>lp", "<cmd>!pint<cr>", { expr = false, silent = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map({ "n", "v" }, "<leader>sv", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("", "<C-a>", "gg0vG$", { noremap = true, desc = "Select all" })

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- surround
map("n", "vv", "viw")
map("v", "<leader>1", "<esc>`>a)<esc>`<i(<esc>")
map("v", "<leader>2", "<esc>`>a}<esc>`<i{<esc>")
map("v", "<leader>3", "<esc>`>a]<esc>`<i[<esc>")
map("v", '<leader>4', '<esc>`>a"<esc>`<i"<esc>')
map("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>")
map("v", "<leader>`", "<esc>`>a`<esc>`<i`<esc>")

map("n", "x", '"_x')
map("n", "s", '"_s')
map("n", "X", '"_X')

--- replace a word with yanked text
map("n", "rw", "viwpyiw")

--- replace till the end of line with yanked text
map("n", "rl", 'Pl"_D')

--- ciw
map("n", "S", "ciw")

--- toggle capitalisation
map("n", "<leader>vw", "g~iw")

local function smart_dd()
    if api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end

map("n", "dd", smart_dd, { noremap = true, expr = true })

local function snake(s)
    s = s or vim.fn.expand("<cword>")
    print("replace: ", s)
    local n = s:gsub('%f[^%l]%u', '_%1'):gsub('%f[^%a]%d', '_%1'):gsub('%f[^%d]%a', '_%1'):gsub('(%u)(%u%l)', '%1_%2')
        :lower()
    vim.fn.setreg('s', n)
    vim.cmd([[exe "norm! ciw\<C-R>s"]])
    print("newstr", n)
end

-- convert to camel case
local function camel(s)
    s = s or vim.fn.expand("<cword>")
    local n = string.gsub(s, "_%a+", function(word)
        local first = string.sub(word, 2, 2)
        local rest = string.sub(word, 3)
        return string.upper(first) .. rest
    end)
    vim.fn.setreg('s', n)
    vim.cmd([[exe "norm! ciw\<C-R>s"]])
end

map("n", "mc", camel) -- snakecase to
map("n", "ms", snake) -- camel to

api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = api.nvim_buf_get_mark(0, '"')
        local lcount = api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf", "help", "man", "notify", "lspinfo", "spectre_panel", "startuptime", "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
        'glepnir/flipped.nvim',
        name = "flipped",
        config = function()
            vim.cmd.colorscheme("flipped")
        end
    },
    {
        'glepnir/whiskyline.nvim',
        config = function()
            require("whiskyline").setup()
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        dependencies = {
            "nvim-treesitter/playground",
            { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "php", "go", "bash", "help", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
                    "python", "query", "tsx", "typescript", "vim", "yaml", "rust"
                },
                context_commentstring = { enable = true, enable_autocmd = false },
                highlight = {
                    enable = true,
                    disable = { "css" },
                },
                autopairs = {
                    enable = true,
                },
                autotag = { enable = true },
                indent = { enable = true, disable = { "python", "css", 'toml' } },
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<leader><space>", ":Telescope find_files<CR>" },
            { "<Leader>ff",      ":Telescope live_grep<CR>" },
            { "<Leader>j",       ":Telescope buffers<CR>" },
            { "<Leader>fh",      ":Telescope help_tags<CR>" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    prompt_prefix = ' ',
                    selection_caret = ' ',
                    layout_config = {
                        horizontal = { prompt_position = 'top', results_width = 0.6 },
                        vertical = { mirror = false },
                    },
                    sorting_strategy = 'ascending',
                    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
                },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup({})
            local status, cmp = pcall(require, 'cmp')
            if not status then
                vim.cmd([[packadd nvim-cmp]])
                cmp = require('cmp')
            end
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        opts = { show_current_context = true }
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            hooks = {
                pre = function()
                    require("ts_context_commentstring.internal").update_commentstring({})
                end,
            },
        },
        config = function(_, opts)
            require("mini.comment").setup(opts)
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = true,
        keys = {
            { "<Leader>e",  ":NvimTreeToggle<cr>" },
            { "<Leader>fe", ":NvimTreeFocus<cr>" },
        },
    },
    {
        "danymat/neogen",
        opts = { snippet_engine = "luasnip", languages = { lua = { annotation_convention = "ldoc" } } },
        keys = {
            { "gcj", ":Neogen<CR>" },
        }
    },
    {
        "j-hui/fidget.nvim",
        config = true
    },
    {
        "folke/neodev.nvim",
        ft = 'lua',
        opts = {
            experimental = {
                pathStrict = true,
            },
            library = {
                runtime = "~/nvim/share/nvim/runtime/",
            },
        },
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        config = function()
            local lsp = require("lsp-zero")
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
            })
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "./snippets/" },
            })
            lsp.preset("recommended")
            lsp.ensure_installed({
                'tsserver',
                'lua_ls',
                'gopls',
                'pyright',
                "intelephense",
            })
            lsp.configure('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim', 'P' }
                        }
                    }
                }
            })
            lsp.setup()

            vim.diagnostic.config({
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            })

            local cmp_config = lsp.defaults.cmp_config({
                window = {
                    completion = {
                        scrolloff = vim.go.scrolloff,
                        border = "rounded",
                    },
                    documentation = {
                        border = "rounded",
                    },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                experimental = {
                    ghost_text = {
                        hl_group = "LspCodeLens",
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<S-j>"] = cmp.mapping.select_next_item(),
                    ["<S-k>"] = cmp.mapping.select_prev_item(),
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip and luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip and luasnip.jumpable( -1) then
                            luasnip.jump( -1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "path" },
                    -- { name = "codeium" },
                    { name = "buffer" },
                }),
            })
            cmp.setup(cmp_config)
        end,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            "L3MON4D3/LuaSnip",
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local nls = require("null-ls")
            nls.setup({
                debounce = 150,
                save_after_format = false,
                sources = {
                    -- nls.builtins.formatting.prettierd,
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.pint,
                    -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
                    -- nls.builtins.formatting.eslint_d,
                    nls.builtins.formatting.isort,
                    nls.builtins.formatting.black,
                    nls.builtins.diagnostics.flake8,
                },
            })
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        config = function()
            require("lspsaga").setup({})
            vim.wo.winbar = require('lspsaga.symbolwinbar'):get_winbar()
        end,
        keys = {
            { '[e',        ':Lspsaga diagnostic_jump_next<cr>' },
            { ']e',        ':Lspsaga diagnostic_jump_prev<cr>' },
            { '[c',        ':Lspsaga show_cursor_diagnostics<cr>' },
            { 'K',         ':Lspsaga hover_doc<cr>' },
            { 'ga',        ':Lspsaga code_action<cr>' },
            { 'gd',        ':Lspsaga peek_definition<cr>' },
            { 'gt',        vim.lsp.buf.type_definition },
            { 'gi',        vim.lsp.buf.implementation },
            { 'gr',        vim.lsp.buf.references },
            { 'gs',        ':Lspsaga signature_help<cr>' },
            { 'rn',        ':Lspsaga rename<cr>' },
            { 'gh',        ':Lspsaga lsp_finder<cr>' },
            { '<Leader>o', ':Lspsaga outline<cr>' },
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add = { hl = 'GitGutterAdd', text = '▍' },
                change = { hl = 'GitGutterChange', text = '▍' },
                delete = { hl = 'GitGutterDelete', text = '▍' },
                topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
                changedelete = { hl = 'GitGutterChange', text = '▍' },
                untracked = { hl = 'GitGutterAdd', text = '▍' },
            },
        }
    },
    {
        'phaazon/hop.nvim',
        event = 'BufRead',
        config = function()
            require('hop').setup({})
        end
    },
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        opts = {
            buffers = {
                background = { colorCode = "deep" },
            },
        },
        keys = {
            { "<Leader>zz", ":NoNeckPain<CR>" },
        },
    },
    -- {
    --     'Exafunction/codeium.vim',
    --     config = function()
    --         vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    --         vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    --         vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions']( -1) end, { expr = true })
    --         vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    --     end
    -- },
    {
        "CRAG666/code_runner.nvim",
        event = "VeryLazy",
        config = function()
            require("code_runner").setup({
                filetype = {
                    python = "python3 -u",
                    typescript = "deno run",
                    php = "php",
                    lua = "lua",
                    go = "go run"
                },
            })
            vim.keymap.set("n", "<leader>ll", ":wall<cr>:RunFile tab<CR>i", { noremap = true, silent = false })
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
        -- stylua: ignore
        keys = {
            { "<leader>ss", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        },
    },
    { "mbbill/undotree" },
    {
        'glepnir/mutchar.nvim',
        ft = { 'go', 'lua', 'php' },
        config = function()
            local filters = require('mutchar.filters')
            require('mutchar').setup({
                ['php'] = {
                    rules = {
                        { '-', '->' },
                        { '=', '=>' }
                    },
                    filter = filters.non_space_before,
                },
                ['lua'] = {
                    rules = { ';', ':' },
                    filter = filters.semicolon_in_lua,
                },
                ['go'] = {
                    rules = {
                        { ';', ' :=' },
                        { ',', ' <-' },
                    },
                    filter = {
                        filters.find_diagnostic_msg({ 'initial', 'undeclare' }),
                        filters.go_arrow_symbol,
                    },
                    one_to_one = true,
                },
            })
        end
    },
    { 'ccaglak/namespace.nvim', dev = true },
    { 'ccaglak/larago.nvim',    dev = true },
    -----------------End
},
    {
        dev = { path = "~/Desktop/Workspace" },
    }
)
