return {
    {
        'vim-jp/vimdoc-ja',
        lazy = true,
        keys = {
            { "h", mode = "c" },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = "BufReadPost",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "svelte",
            },
        },
    },
    {
        'RRethy/nvim-base16',
        -- event = "BufEnter",
        lazy = true,
        config = function()
            vim.cmd("colorscheme base16-dracula")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        --event = "BufEnter",
        event = "VimEnter",
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tpope/vim-fugitive',
            'RRethy/nvim-base16',
        },
        config = {
            options = {
                theme = "base16",
                sections = {
                    lualine_c = {
                        {
                            'diagnostics',
                            sources = { 'nvim_diagnostic', 'nvim_lsp' },
                            sections = { 'error', 'warn', 'info', 'hint' },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
                        },
                    },
                },
            }
        },
    },

    -- UI integration
    {
        'tpope/vim-fugitive',
        lazy = true,
        keys = {
            { "<leader>gg", "<cmd>Git<CR>",        desc = "git status" },
            { "<leader>gc", "<cmd>Git commit<CR>", desc = "git commit" },
        }
    },
    {
        "folke/which-key.nvim",
        event = "BufEnter",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- file manager
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        event = "BufEnter",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files(require("telescope.themes").get_ivy()) end, desc = "find files" },
            { "<leader>bf", function() require("telescope.builtin").buffers(require("telescope.themes").get_ivy()) end, desc = "find buffers" },
        },
        cmd = {
            "Telescope",
        },
    },
    -- {
    --     'junegunn/fzf.vim',
    --     lazy = true,
    --     keys = {
    --         {"<leader>of", "<cmd>Files .<CR>", desc = "files list"},
    --         {"<leader>bl", "<cmd>Buffers .<CR>", desc = "buffers list"},
    --     },
    --     cmd = {
    --         "Files",
    --         "Buffers",
    --     },
    --     config = function()
    --         require("fzf").setup()
    --     end
    -- },
    {
        "lambdalisue/fern.vim",
        event = "BufEnter",
        keys = {
            { "<leader>fd", "<cmd>Fern . -drawer<CR>", desc = "fern on cwd" },
        },
        cmd = "Fern"
    },

    -- utils
    {
        'editorconfig/editorconfig-vim',
        event = "BufReadPost",
    },
    {
        'mattn/emmet-vim',
        ft = { 'html', 'elm', 'gohtmltmpl', 'php', "svelte" },
    },

    -- completion
    {
        -- https://coralpink.github.io/commentary/neovim/lsp/nvim-cmp.html
        'hrsh7th/nvim-cmp',
        event = {"InsertEnter", "CmdlineEnter"},
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            "hrsh7th/cmp-buffer",
        },
        config = function()
            local cmp = require 'cmp'
            local map = cmp.mapping

            cmp.setup {
                mapping = map.preset.insert {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = map.scroll_docs(-4),
                    ['<C-f>'] = map.scroll_docs(4),
                    ['<C-Space>'] = map.complete(),
                    ['<C-e>'] = map.abort(),
                    ['<CR>'] = map.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                },
                sources = cmp.config.sources {
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'buffer' },
                },
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                }
            }
        end
    },
    {
        'hrsh7th/cmp-vsnip',
        lazy = true,
        dependencies = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
        },
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
            require "extensions.nvim-lspconfig"
        end,
    },
    {
        -- https://coralpink.github.io/commentary/neovim/lsp/mason.html
        "williamboman/mason.nvim",
        --event = "InsertEnter",
        event = "BufReadPost",
        build = ":MasonUpdate",
        cmd = "Mason",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        --event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            'hrsh7th/cmp-nvim-lsp',
            --{ "echasnovski/mini.completion", version = false },
        },
        config = function()
            local lspconfig = require("lspconfig")
            --require('mini.completion').setup({})
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    lspconfig[server_name].setup {
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    }
                end,
            }
        end
    },
    -- go
    {
        'fatih/vim-go',
        ft = { "go" },
    },
    -- rust
    {
        "rust-lang/rust.vim",
        ft = { "rust" },
    }
}
