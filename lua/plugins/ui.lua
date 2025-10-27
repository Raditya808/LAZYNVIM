return {
  -- Alpha dashboard
  {
    "goolord/alpha-nvim",
    enabled = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")

      local heading1 = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      dashboard.section.header.val = heading1
      alpha.setup(dashboard.opts)
    end,
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          lsp = {
            overide = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
          },
          presets = {
            bottom_search = true,
            command_pallete = true,
            long_message_to_split = true,
            inc_rename = true,
            lsp_doc_border = false,
          },
        },
      })
    end,
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    enabled = true,
    config = function()
      vim.cmd.colorscheme("delek")

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "fugitive", "quickfix" },
      })

      -- Sesuaikan warna lualine agar cocok dengan delek
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2c2c2c", fg = "#d7d7d7" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1e1e1e", fg = "#808080" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
      })
    end,
  },

  -- mini.indentscope
  {
    "echasnovski/mini.indentscope",
    version = false,
    config = function()
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
        vim.api.nvim_create_autocmd("filetype", {
          pattern = {
            "alpha",
            "dashboard",
            "noice",
            "fzf",
            "help",
            "lazy",
            "lazyterm",
            "mason",
            "neo-tree",
            "notify",
            "toggleterm",
            "Trouble",
            "trouble",
            "dbee",
            "dbui",
            "nvimtree",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "snacks_win",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        }),
      })
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "thin",
          numbers = "buffer_id",
        },
        highlights = {
          fill = { bg = "#1c1c1c" },
          background = { fg = "#a0a0a0", bg = "#1c1c1c" },
          tab_selected = { fg = "#ffffff", bg = "#2e2e2e", bold = true },
        },
      })
    end,
  },

  -- Web devicons (warna ikon disesuaikan agar tidak terlalu terang)
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          lua = { icon = "", color = "#6ca0a3", name = "Lua" },
          json = { icon = "", color = "#bdae93", name = "Json" },
          toml = { icon = "", color = "#a99f5d", name = "Toml" },
          md = { icon = "", color = "#7a95c9", name = "Markdown" },
          git = { icon = "", color = "#af5f5f", name = "Git" },
          default_icon = { icon = "", color = "#c0a060", name = "Default" },
        },
        default = true,
      })
    end,
  },

  -- transparent
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent")

      transparent.setup({
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {},
        exclude_groups = {},
        on_clear = function() end,
      })

      transparent.clear_prefix("BufferLine")
      transparent.clear_prefix("Neotree")
      transparent.clear_prefix("telescope")
    end,
  },
}
