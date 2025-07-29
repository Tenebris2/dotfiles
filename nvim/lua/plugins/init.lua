return {

  { "loctvl842/monokai-pro.nvim", name = "monokai", priority = 1000 },
  { "shaunsingh/nord.nvim", name = "nord", priority = 1000 },
  { "projekt0n/github-nvim-theme", name = "github-theme", priority = 1000 },
  { "marko-cerovac/material.nvim", name = "material", priority = 1000 },
  { "neanias/everforest-nvim", name = "everforest", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
  {
    "CRAG666/betterTerm.nvim",
    opts = {
      position = "bot",
      size = 15,
    },
    event = "VimEnter",
  },
  { "CRAG666/code_runner.nvim", config = true },
  {
    "nvim-pack/nvim-spectre",
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = "VimEnter",
    opts = {
      -- configurations go here
    },
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require("symbol-usage").setup()
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        python = { "ruff" },
        lua = { "luacheck" },
        -- add other filetypes and linters as needed
      }
    end,
    event = { "BufReadPre", "BufNewFile" }, -- Only load linting on file read or creation
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VimEnter",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
    ft = { "markdown" },
  },
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "<localleader>a",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    event = "VimEnter",
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      vim.g.mkdp_markdown_css = "~/markdown.css"
    end,
    ft = { "markdown" },
    event = "VimEnter",
  },
  {
    "github/copilot.vim",
  },
  {
    "ray-x/web-tools.nvim",
    event = "VimEnter",
    config = function()
      require("web-tools").setup {
        keymaps = {
          rename = nil, -- by default use same setup of lspconfig
          repeat_rename = ".", -- . to repeat
        },
        hurl = { -- hurl default
          show_headers = false, -- do not show http headers
          floating = false, -- use floating windows (need guihua.lua)
          json5 = false, -- use json5 parser require json5 treesitter
          formatters = { -- format the result by filetype
            json = { "jq" },
            html = { "prettier", "--parser", "html" },
          },
        },
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VimEnter",
    config = function()
      require("neoscroll").setup {

        mappings = { -- Keys to be mapped to their corresponding default scrolling animation
          "<C-u>",
          "<C-d>",
          "<C-b>",
          "<C-f>",
          "<C-y>",
          "<C-e>",
          "zt",
          "zz",
          "zb",
        },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing = "quadratic", -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
        ignored_events = { -- Events ignored while scrolling
          "WinScrolled",
          "CursorMoved",
        },
      }
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini pggklugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        command = "FormatWriteLock",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "black",
        "terraform-ls",
        "ansible-language-server",
        "mypy",
        "ruff",
        "pyright",
        "debugpy",
        "clangd",
        "rust-analyzer",
        "gopls",
        "eslint-lsp",
        "typescript-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
  },
}
