return {
    {
        'vim-jp/vimdoc-ja',
        lazy = true,
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
    	    },
    	},
    },
    {
        'RRethy/nvim-base16',
        event = "BufEnter",
        config = function()
            vim.cmd("colorscheme base16-dracula")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "BufEnter",
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
            {"<leader>gg", "<cmd>Git<CR>", desc = "git status"},
            {"<leader>gc", "<cmd>Git commit<CR>", desc = "git commit"},
        }
    },
    {
        "folke/which-key.nvim",
        event = "BufReadPost",
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
        'junegunn/fzf.vim',
        keys = {
            {"<leader>of", "<cmd>Files .<CR>", desc = "files list"},
            {"<leader>bl", "<cmd>Buffers .<CR>", desc = "buffers list"},
        }
    },
    {
        "lambdalisue/fern.vim",
        keys = {
            {"<leader>op", "<cmd>Fern . -drawer<CR>", desc = "fern on cwd"},
        },
        cmd = "Fern",
    },

    -- utils
    {
        'editorconfig/editorconfig-vim',
        event = "BufReadPost",
    },
    {
        'mattn/emmet-vim',
        ft = {'html', 'elm', 'gohtmltmpl', 'php'}
    },

    -- completion
    {
        -- https://coralpink.github.io/commentary/neovim/lsp/nvim-cmp.html
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local cmp = require 'cmp'
            local map = cmp.mapping

            cmp.setup {
              mapping = map.preset.insert {
                ['<C-d>'] = map.scroll_docs(-4),
                ['<C-f>'] = map.scroll_docs(4),
                ['<C-Space>'] = map.complete(),
                ['<C-e>'] = map.abort(),
                ['<CR>'] = map.confirm { select = false },
              },
              sources = cmp.config.sources {
                { name = 'nvim_lsp' },
              },
            }
        end
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function ()
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
    }
}
