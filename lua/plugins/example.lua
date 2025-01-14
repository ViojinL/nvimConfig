-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

  return {
    -- 添加 gruvbox 颜色主题
    { "ellisonleao/gruvbox.nvim" },

    -- 配置 LazyVim 使用 gruvbox
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },

    -- 添加并配置 nvim-tree 文件树插件
    { "kyazdani42/nvim-tree.lua" },

    -- 配置 nvim-cmp 并添加 cmp-emoji
    {
      "hrsh7th/nvim-cmp",
      dependencies = { "hrsh7th/cmp-emoji" },
      opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      end,
    },

    -- 配置 Telescope 插件
    {
      "nvim-telescope/telescope.nvim",
      keys = {
        {
          "<leader>fp",
          function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
          desc = "Find Plugin File",
        },
      },
      opts = {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        },
      },
    },

    -- 添加并配置 LSP 服务器
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          pyright = {},
          tsserver = {},
          ccls = {},
          jdtls = {},
        },
        setup = {
          tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
          end,
        },
      },
    },

    -- 添加 treesitter 解析器并启用语法高亮
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "c",
        "cpp",
        "java",
      })
      require('nvim-treesitter.configs').setup {
        ensure_installed = opts.ensure_installed,
        highlight = {
          enable = true,
        },
      }
      end,
    },

    -- 配置 lualine 状态栏
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
        return "😄"
        end,
      })
      end,
    },

    -- 添加工具
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",
          "flake8",
          "ccls",
          "jdtls",
        },
      },
    },
  }
