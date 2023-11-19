return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    --
    -- enable servers that you already have installed without mason
    servers = {
      "pyright",
      -- install "dartls" and config lineLength to 120
      "dartls", -- { "dartls", config = { lineLength = 120 } },
    },
    -- ["server-settings"] = {
    --   dartls = {
    --     settings = {
    --       dart = {
    --         lineLength = 120
    --       }
    --     }
    --   }
    -- }
    -- set lineLength of dartls to 120 in Astronvim
    ["server-settings"] = {
      dartls = {
        settings = {
          lineLength = 120
        }
      }
    }
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = false },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- lua, default settings
    -- require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "./lua/user/snippets" } })
    -- vim.api.nvim_set_keymap("n", "<leader>am", ":MinimapToggle<CR>", {})
    -- run dart lsp manually using LspStart dartls
    -- vim.cmd("LspStart dartls")
    -- vim.ui.select = require "popui.ui-overrider"
    -- vim.ui.input = require "popui.input-overrider"
    -- trigger easy-action.
    -- hoo
    -- local opts = { silent = true, remap = false }
    -- vim.keymap.set("n", "<leader>s", "<cmd>BasicEasyAction<cr>", opts)

    -- To insert something and jump back after you leave the insert mode
    -- vim.keymap.set("n", "<leader>S", function()
    --   require("easy-action").base_easy_action("i", nil, "InsertLeave")
    -- end, opts)


    -- set auto select first suggest
    -- vim.api.nvim_set_keymap('i', '<expr> <Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, silent = true })


    -- require('cmp').setup({
    --   -- Default setup in README.md
    --   preselect = require('cmp').PreselectMode.Item,
    --   completion = {
    --     completeopt = menu, menuone, noinsert, noselect
    --   },
    -- })

    -- local cmp = require('cmp')
    -- cmp.setup({
    --   enabled = true,
    --   sources = {
    --     { name = 'nvim_lsp' }
    --   }
    -- })
    --



    -- vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
    -- vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
    -- vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
    -- vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    -- vim.keymap.set("n", "<C-n>", "<Plug>(YankyCycleForward)")
    -- vim.keymap.set("n", "<C-p>", "<Plug>(YankyCycleBackward)")
    -- map <leader>e to Neotree toggle filesystem
    -- vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle filesystem<CR>", {})

    -- vim.cmd("redraw!")

    -- vim.api.nvim_set_keymap("n", "gc", "Vgc", {})


    -- vim.g.minimap_auto_start = 1
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
