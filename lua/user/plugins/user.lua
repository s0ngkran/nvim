return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        -- set delay 1000
        debounce_delay = 1000,
        -- set no format buffer after saved
      }
    end,
  }
  ,
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    lazy = false,
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        lsp = {
          on_attach = on_attach,
          settings = {
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/flutter/packages"),
              vim.fn.expand("$HOME/flutter/.pub-cache"),
            }
          }
        },
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
          -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
          -- please note that this option is eventually going to be deprecated and users will need to
          -- depend on plugins like `nvim-notify` instead.
          -- notification_style = 'native' | 'plugin'
        },

        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          }
        },
        debugger = {
          -- integrate with nvim dap + install dart code debugger
          enabled = true,
          run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
          -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
          -- see |:help dap.set_exception_breakpoints()| for more info
          exception_breakpoints = {},
          register_configurations = function(paths)
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "consumer",
              },
            }
          end,
        }
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = false,
    event = "InsertEnter",
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 200,
          keymap = {
            -- accept = "<S-CR>",
            accept = "<C-x><C-x>j",
            accept_word = false,
            accept_line = false,
            -- next = "<leader>j",
            -- prev = "<leader>k",
            -- dismiss = "<leader>c",
          },
        },
        filetypes = {
          dart = true,
          js = true,
          javascript = true,
          lua = true,
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      -- TODO:
      -- BUG:
      -- FIX:
      -- todo
      -- todo
      -- INFO
      -- todo
      ---
      -- INFO: howw
      require("todo-comments").setup
      {
        -- howwww
        signs = true,      -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo: comments
        keywords = {
          FIX = {
            icon = " ",                              -- icon used for the sign, and in search results
            color = "error",                            -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = {
            icon = "  ",
            color = "info",
            alt = { "todo" }
          },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO", "info" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE",         -- The gui style to use for the fg highlight group.
          bg = "BOLD",         -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true,               -- enable multine todo comments
          multiline_pattern = "^.",       -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10,         -- extra lines that will be re-evaluated when changing a line
          before = "",                    -- "fg" or "bg" or empty
          keyword = "wide",               -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg",                   -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true,           -- uses treesitter to match keywords in comments only
          max_line_len = 400,             -- ignore lines longer than this
          exclude = {},                   -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      }
    end
  },
  -- {
  --   'wfxr/minimap.vim',
  --   lazy = true,
  --   config = function()
  --     -- vim.g.minimap_auto_start = 1
  --     -- todo
  --     -- TODO
  --     -- Todo
  --     -- require('mini.map').setup(
  --     -- -- No need to copy this inside `setup()`. Will be used automatically.
  --     --   {
  --     --     -- Highlight integrations (none by default)
  --     --     integrations = nil,
  --     --     -- Symbols used to display data
  --     --     symbols = {
  --     --       -- Encode symbols. See `:h MiniMap.config` for specification and
  --     --       -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
  --     --       -- Default: solid blocks with 3x2 resolution.
  --     --       encode = nil,
  --     --       -- Scrollbar parts for view and line. Use empty string to disable any.
  --     --       scroll_line = '█',
  --     --       scroll_view = '┃',
  --     --     },
  --     --     -- Window options
  --     --     window = {
  --     --       -- Whether window is focusable in normal way (with `wincmd` or mouse)
  --     --       focusable = false,
  --     --       -- Side to stick ('left' or 'right')
  --     --       side = 'right',
  --     --       -- Whether to show count of multiple integration highlights
  --     --       show_integration_count = true,
  --     --       -- Total width
  --     --       width = 10,
  --     --       -- Value of 'winblend' option
  --     --       winblend = 25,
  --     --     },
  --     --   })
  --   end,
  -- },
  {
    'airblade/vim-gitgutter',
    lazy = false,
  },
  {
    'tpope/vim-fugitive',
    lazy = false,
  },
  -- Lua
  -- {
  --   -- error len
  --   "folke/trouble.nvim",
  --   requires = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {
  --       position = "bottom",            -- position of the list can be: bottom, top, left, right
  --       height = 10,                    -- height of the trouble list when position is top or bottom
  --       width = 50,                     -- width of the list when position is left or right
  --       icons = true,                   -- use devicons for filenames
  --       mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  --       fold_open = "",              -- icon used for open folds
  --       fold_closed = "",            -- icon used for closed folds
  --       group = true,                   -- group results by file
  --       padding = true,                 -- add an extra new line on top of the list
  --       action_keys = {
  --         -- key mappings for actions in the trouble list
  --         -- map to {} to remove a mapping, for example:
  --         -- close = {},
  --         close = "q",                     -- close the list
  --         cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
  --         refresh = "r",                   -- manually refresh
  --         jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
  --         open_split = { "<c-x>" },        -- open buffer in new split
  --         open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
  --         open_tab = { "<c-t>" },          -- open buffer in new tab
  --         jump_close = { "o" },            -- jump to the diagnostic and close the list
  --         toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
  --         toggle_preview = "P",            -- toggle auto_preview
  --         hover = "K",                     -- opens a small popup with the full multiline message
  --         preview = "p",                   -- preview the diagnostic location
  --         close_folds = { "zM", "zm" },    -- close all folds
  --         open_folds = { "zR", "zr" },     -- open all folds
  --         toggle_fold = { "zA", "za" },    -- toggle fold of current file
  --         previous = "k",                  -- previous item
  --         next = "j"                       -- next item
  --       },
  --       indent_lines = true,               -- add an indent guide below the fold icons
  --       auto_open = false,                 -- automatically open the list when you have diagnostics
  --       auto_close = false,                -- automatically close the list when you have no diagnostics
  --       auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  --       auto_fold = false,                 -- automatically fold a file trouble list at creation
  --       auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
  --       signs = {
  --         -- icons / text used for a diagnostic
  --         error = "",
  --         warning = "",
  --         hint = "",
  --         information = "",
  --         other = "﫠"
  --       },
  --       use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  --     }
  --   end
  -- },
  -- {
  --   "rafamadriz/friendly-snippets",
  --   lazy = false,
  -- },
  {
    'dinhhuy258/git.nvim',
    config = function()
      require('git').setup({
        default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`
        keymaps = {
          -- Open blame window
          blame = "<leader>aaa",
          -- Close blame window
          quit_blame = "q",
          -- Open blame commit
          blame_commit = "<CR>",
          -- Open file/folder in git repository
          browse = "<Leader>go",
          -- Open pull request of the current branch
          open_pull_request = "<Leader>gp",
          -- Create a pull request with the target branch is set in the `target_branch` option
          create_pull_request = "<Leader>gn",
          -- Opens a new diff that compares against the current index
          diff = "<Leader>gd",
          -- Close git diff
          diff_close = "<Leader>gD",
          -- Revert to the specific commit
          revert = "<Leader>gr",
          -- Revert the current file to the specific commit
          revert_file = "<Leader>gR",
        },
        -- Default target branch when create a pull request
        target_branch = "master",
      })
    end
  },
  {
    'sindrets/diffview.nvim',
    lazy = false,
    requires = 'nvim-lua/plenary.nvim'
  },
  -- nvim v0.7.2
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
  ---------------------------
  {
    'ldelossa/litee.nvim',
    lazy = false,
  },
  {
    'ldelossa/litee-calltree.nvim',
    lazy = false,
  },
  {
    'ldelossa/gh.nvim',
    lazy = false,
    requires = { { 'ldelossa/litee.nvim' } },
    config = function()
      require('litee.lib').setup()
      require('litee.gh').setup({
        -- deprecated, around for compatability for now.
        jump_mode             = "invoking",
        -- remap the arrow keys to resize any litee.nvim windows.
        map_resize_keys       = false,
        -- do not map any keys inside any gh.nvim buffers.
        disable_keymaps       = false,
        -- the icon set to use.
        icon_set              = "default",
        -- any custom icons to use.
        icon_set_custom       = nil,
        -- whether to register the @username and #issue_number omnifunc completion
        -- in buffers which start with .git/
        git_buffer_completion = true,
        -- defines keymaps in gh.nvim buffers.
        keymaps               = {
          -- when inside a gh.nvim panel, this key will open a node if it has
          -- any futher functionality. for example, hitting <CR> on a commit node
          -- will open the commit's changed files in a new gh.nvim panel.
          open = "<CR>",
          -- when inside a gh.nvim panel, expand a collapsed node
          expand = "zo",
          -- when inside a gh.nvim panel, collpased and expanded node
          collapse = "zc",
          -- when cursor is over a "#1234" formatted issue or PR, open its details
          -- and comments in a new tab.
          goto_issue = "gd",
          -- show any details about a node, typically, this reveals commit messages
          -- and submitted review bodys.
          details = "d",
          -- inside a convo buffer, submit a comment
          submit_comment = "<C-s>",
          -- inside a convo buffer, when your cursor is ontop of a comment, open
          -- up a set of actions that can be performed.
          actions = "<C-a>",
          -- inside a thread convo buffer, resolve the thread.
          resolve_thread = "<C-r>",
          -- inside a gh.nvim panel, if possible, open the node's web URL in your
          -- browser. useful particularily for digging into external failed CI
          -- checks.
          goto_web = "gx"
        }
      })
    end
  },
  -- {
  --   'nvim-tree/nvim-web-devicons',
  --   lazy = false,
  --   config = function()
  --     require 'nvim-web-devicons'.setup {
  --       -- your personnal icons can go here (to override)
  --       -- you can specify color or cterm_color instead of specifying both of them
  --       -- DevIcon will be appended to `name`
  --       override = {
  --         zsh = {
  --           icon = "",
  --           color = "#428850",
  --           cterm_color = "65",
  --           name = "Zsh"
  --         }
  --       },
  --       -- globally enable different highlight colors per icon (default to true)
  --       -- if set to false all icons will have the default icon's color
  --       color_icons = true,
  --       -- globally enable default icons (default to false)
  --       -- will get overriden by `get_icons` option
  --       default = true,
  --       -- globally enable "strict" selection of icons - icon will be looked up in
  --       -- different tables, first by filename, and if not found by extension; this
  --       -- prevents cases when file doesn't have any extension but still gets some icon
  --       -- because its name happened to match some extension (default to false)
  --       strict = true,
  --       -- same as `override` but specifically for overrides by filename
  --       -- takes effect when `strict` is true
  --       override_by_filename = {
  --         [".gitignore"] = {
  --           icon = "",
  --           color = "#f1502f",
  --           name = "Gitignore"
  --         }
  --       },
  --       -- same as `override` but specifically for overrides by extension
  --       -- takes effect when `strict` is true
  --       override_by_extension = {
  --         ["log"] = {
  --           icon = "",
  --           color = "#81e043",
  --           name = "Log"
  --         }
  --       },
  --     }
  --   end
  -- },
  {
    'pwntester/octo.nvim',
    lazy = false,
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  },
  -- {
  --   'zivyangll/git-blame.vim',
  --   lazy = false,
  -- },
  -- unused
  -- {
  --   'MunifTanjim/prettier.nvim',
  --   lazy = false,
  --   config = function()
  --     require "prettier".setup({
  --       bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  --       filetypes = {
  --         "css",
  --         "graphql",
  --         "html",
  --         "javascript",
  --         "javascriptreact",
  --         "json",
  --         "less",
  --         "markdown",
  --         "scss",
  --         "typescript",
  --         "typescriptreact",
  --         "yaml",
  --         "dart"
  --       },
  --       cli_options = {
  --         print_width = 1200,
  --       },
  --     })
  --   end
  -- },
  -- unused
  -- {
  --   'vijaymarupudi/nvim-fzf',
  --   lazy = false,
  -- },
  -- {
  --   'rbong/vim-flog',
  --   lazy = false,
  -- },
  {
    'tpope/vim-fugitive',
    lazy = false,
  },
  {
    'junegunn/gv.vim',
    lazy = false,
  },
  -- for searching fzf
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = false,
    -- run =
    -- 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    run = 'make',
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
    end,
  },
  {
    'cljoly/telescope-repo.nvim',
    lazy = false,
    config = function()
      require("telescope").setup {
        extensions = {
          repo = {
            list = {
              fd_opts = {
                "--no-ignore-vcs",
              },
              search_dirs = {
                "~/projects/",
              },
            },
          },
        },
      }

      require("telescope").load_extension "repo"
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  },
  -- {
  --   "quangnguyen30192/cmp-nvim-ultisnips",
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   requires = { { "quangnguyen30192/cmp-nvim-ultisnips", } },
  --   config = function()
  --     -- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
  --     require("cmp_nvim_ultisnips").setup {
  --       filetype_source = "treesitter",
  --       show_snippets = "all",
  --       documentation = function(snippet)
  --         return snippet.description
  --       end
  --     }
  --   end,
  -- },
  -- {
  --   'SirVer/ultisnips',
  -- },
  --
  -- {
  --   'neoclide/coc.nvim',
  --   branch = 'release',
  --   -- run = 'yarn install --frozen-lockfile',
  --   lazy = false,
  --   config = function()
  --     vim.g.coc_global_extensions = {
  --       'coc-json',
  --       'coc-tsserver',
  --       -- 'coc-eslint',
  --       -- 'coc-prettier',
  --       -- 'coc-css',
  --       -- 'coc-html',
  --       -- 'coc-yaml',
  --       -- 'coc-graphql',
  --       -- 'coc-ultisnips',
  --       'coc-snippets',
  --       -- 'coc-git',
  --       -- 'coc-fzf-preview',
  --     }
  --   end,
  -- },
  -- {
  --   'michaelb/sniprun',
  --   run = 'sh ./install.sh',
  --   lazy = false,
  -- }
  -- {
  --   "nacro90/numb.nvim",
  --   lazy = false,
  --   config = function()
  --     require("numb").setup()
  --   end,
  -- },
  {
    'ray-x/guihua.lua',
    lazy = false,
  },
  -- {
  --   'ray-x/forgit.nvim',
  --   lazy = false,
  --   config = function()
  --     require('forgit').setup()
  --   end,
  -- },
  -- use trouble instead
  -- {
  --   "chikko80/error-lens.nvim",
  --   lazy = false,
  --   event = "BufRead",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   opts = {
  --     -- your options go here
  --   },
  -- }
  {
    'weilbith/nvim-code-action-menu',
    lazy = false,
    cmd = 'CodeActionMenu',
  },
  {
    'hood/popui.nvim',
    lazy = false,
    config = function()
    end,
  },
  -- {
  --   'junegunn/fzf.vim',
  --   lazy = false,
  -- },
  -- {
  --   'junegunn/fzf',
  --   lazy = true,
  -- },
  -- {
  --   'vijaymarupudi/nvim-fzf',
  --   lazy = true,
  -- },
  -- {
  --   'ibhagwan/fzf-lua',
  --   lazy = true,
  --   -- optional for icon support
  --   requires = { 'nvim-tree/nvim-web-devicons' }
  -- }
  -- {
  --   'voldikss/vim-floaterm',
  --   lazy = false,
  -- },
  --
  {
    'crusj/bookmarks.nvim',
    branch = 'main',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("bookmarks").setup({
        keymap = {
          toggle = "<leader>aj",                                               -- Toggle bookmarks
          add = "mmm",                                                         -- Add bookmarks
          jump = "<leader>",                                                   -- Jump from bookmarks
          delete = "dd",                                                       -- Delete bookmarks
          order = "<tab><tab>",                                                -- Order bookmarks by frequency or updated_time
          delete_on_virt = "mmd",                                              -- Delete bookmark at virt text line
          show_desc = "mms",                                                   -- show bookmark desc
        },
        width = 0.8,                                                           -- Bookmarks window width:  (0, 1]
        height = 0.7,                                                          -- Bookmarks window height: (0, 1]
        preview_ratio = 0.55,                                                  -- Bookmarks preview window ratio (0, 1]
        preview_ext_enable = false,                                            -- If true, preview buf will add file ext, preview window may be highlighed(treesitter), but may be slower.
        fix_enable = false,                                                    -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.
        virt_text = "🔖",                                                    -- Show virt text at the end of bookmarked lines
        virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs", "*.dart" }, -- Show virt text only on matched pattern
        border_style = "single",                                               -- border style: "single", "double", "rounded" hl = {
        --   border = "TelescopeBorder",                            -- border highlight
        --   cursorline = "guibg=Gray guifg=White",                 -- cursorline highlight
        -- }
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(
        {
          toggler = {
            ---Line-comment toggle keymap
            line = 'gc',
            ---Block-comment toggle keymap
            block = 'gb',
          },
          opleader = {
            ---Line-comment keymap
            line = 'gc',
            ---Block-comment keymap
            block = 'gb',
          },
          mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = false,
          },
        }
      )
    end
  },
  {
    'kevinhwang91/promise-async',
    lazy = false,
  },
  {
    'Weissle/easy-action',
    lazy = false,
    requires = {
      {
        "kevinhwang91/promise-async",
        module = { "async" },
      }
    },
    config = function()
      require("easy-action").setup({
        jump_provider_config = {
          hop = {
            action_select = {
              char1 = {
                -- action ends with any char of options will use HopChar1MW command.
                options = "(){}[]<>`'\"",
                cmd = "HopChar1MW",
                feed = function(action)
                  return string.sub(action, #action)
                end,
              },
              line = {
                -- action ends with any char of options will use HopLineMW command.
                options = "yd",
                cmd = "HopLineMW",
              },
              -- Default command.
              default = "HopChar1MW",
            },
          },
        }
      })
    end
  },
  -- { "chrisgrieser/nvim-spider" },
  -- { "kkharji/sqlite.lua" },
  -- {
  --   "gbprod/yanky.nvim",
  --   lazy = false,
  --   requires = { "kkharji/sqlite.lua" },
  --   config = function()
  --     require("yanky").setup({
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --       ring = {
  --         history_length = 100,
  --         storage = "shada",
  --         sync_with_numbered_registers = true,
  --         cancel_event = "update",
  --         ignore_registers = { "_" },
  --       },
  --       system_clipboard = {
  --         sync_with_ring = true,
  --       },
  --     })
  --   end,
  -- }
  -- install without yarn or npm
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = function() vim.fn["mkdp#util#install"]() end,
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  --   setup = function()
  --     vim.g.mkdp_filetypes = {
  --       "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
  {
    "nvim-telescope/telescope-project.nvim",
    lazy = false,
    config = function()
      require 'telescope'.load_extension('project')
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "1.2.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    lazy = false,
    config = function()
      -- load snippets from path/of/your/nvim/config/my-cool-snippets
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/user/snippets" } })
      -- local ls = require("luasnip")

      -- require("luasnip.loaders.from_snipmate").load({ path = { "~/.config/nvim/lua/user/snippets/"  } })
      require("luasnip.loaders.from_snipmate").load({ path = { "~/.config/nvim/snippets/" } })
      -- local s = ls.snippet
      -- local t = ls.text_node
      -- lua require("luasnip").add_snippets('all', { require("luasnip").snippet("test", { require("luasnip").text_node("hi hello world sksk eixei"), }), })
      -- add snip
      -- ls.add_snippets('all', {
      --   s("test", {
      --     t("hi hello world sksk eixei"),
      --   }),
      --   s("td", {
      --     t("// TODO: "),
      --   }),
      --   s("un", {
      --     t("// TODO: uncomment"),
      --   }),
      --   s("ll", {
      --     t("console.log(`" + t + "`);"),
      --   }),
      -- })
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      -- set bidirection
      -- vim.g.leap_default_direction = 'bidirectional'
      require('leap').add_default_mappings()
      require('leap').add_repeat_mappings(';', ',', {
        -- False by default. If set to true, the keys will work like the
        -- native semicolon/comma, i.e., forward/backward is understood in
        -- relation to the last motion.
        relative_directions = true,
        -- By default, all modes are included.
        modes = { 'n', 'x', 'o' },
      })


      vim.keymap.set('n', 's', function()
        local current_window = vim.fn.win_getid()
        require('leap').leap { target_windows = { current_window } }
      end)
    end
  },
  {
    "ggandor/leap-spooky.nvim",
    config = function()
      require('leap-spooky').setup {
        affixes = {
          -- Mappings will be generated corresponding to all native text objects,
          -- like: (ir|ar|iR|aR|im|am|iM|aM){obj}.

          -- Special line objects will also be added, by repeating the affixes.
          -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
          -- window.
          -- The cursor moves to the targeted object, and stays there.
          magnetic = { window = 'm', cross_window = 'M' },
          -- The operation is executed seemingly remotely (the cursor boomerangs
          -- back afterwards).
          remote = { window = 'r', cross_window = 'R' },
        },
        -- If this option is set to true, the yanked text will automatically be pasted
        -- at the cursor position if the unnamed register is in use.
        paste_on_remote_yank = true,

      }
    end
  },
  {
    'ggandor/flit.nvim',
    lazy = false,
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = false,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {}
      }
    end
  },
  -- plugin for using vim in browser
  {
    'subnut/nvim-ghost.nvim',
    lazy = false,
  },
  -- plugin for coding with team
  {
    'jbyuki/instant.nvim',
    lazy = false,
  },

  -- {
  --   'yamatsum/nvim-nonicons',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  --   lazy = false,
  --   config = function()
  --     require('nvim-nonicons').setup {}
  --   end,
  -- }
  {
    -- file mark using
    -- gH to mark
    -- gh to view
    -- gh -> dd to delete mark
    'ThePrimeagen/harpoon',
    lazy = false,
    config = function()
      require("harpoon").setup({})
    end
  },
  -- draw diagram -> not working
  {
    "jbyuki/venn.nvim",
    lazy = false,
    config = function()
      -- venn.nvim: enable or disable keymappings
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd [[setlocal ve=all]]
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
          -- change statusbar color to green
          vim.cmd [[hi StatusLine guibg=green]]
          -- update ui using astro reload
          vim.cmd [[AstroReload]]
        else
          vim.cmd [[setlocal ve=]]
          vim.cmd [[mapclear <buffer>]]
          vim.b.venn_enabled = nil
          -- change statusbar to old color
          vim.cmd [[hi StatusLine guibg=NONE]]
          -- update
          vim.cmd [[AstroReload]]
        end
      end

      -- toggle keymappings for venn using <leader>v
      vim.api.nvim_set_keymap('n', '<leader>v',
        ":lua Toggle_venn()<CR>",
        { noremap = true })
    end
  },
  -- {
  --   "vim-scripts/DrawIt",
  --   lazy = false,
  -- },
  {
    -- jump across functions
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup({})
    end
  },
  {
    'vimwiki/vimwiki',
    lazy = false,
  },
  -- {
  --   "max397574/better-escape.nvim",
  --   lazy = false,
  --   config = function()
  --     -- lua, default settings
  --     require("better_escape").setup {
  --       mapping = { "jk", "jj", 'yw','hj'}, -- a table with mappings to use
  --       timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  --       clear_empty_lines = false, -- clear line after escaping if there is only whitespace
  --       keys = "<Esc>",         -- keys used for escaping, if it is a function will use the result everytime
  --       -- example(recommended)
  --       -- keys = function()
  --       --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
  --       -- end,
  --     }
  --   end,
  -- }
  -- go lang
  {
    'fatih/vim-go',
    lazy = false,
  }

}
