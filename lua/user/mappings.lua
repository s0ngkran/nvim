-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local combo = function(str)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), 'm', true)
end
return {
  -- first key is the mode

  n = {
    -- leader f to find all files
    ["<leader>f"] = {
      "<cmd>Telescope find_files<cr>", desc = "Find File",
    },
    ["<leader>w"] = {
      "<cmd>Telescope live_grep<cr>", desc = "Find File",
    },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bt"] = { "<cmd>tabNext<cr>", desc = "tab next" },
    ["<leader>bc"] = { "<cmd>tabclose<cr>", desc = "tab close" },
    ["<leader>bT"] = { "<cmd>tabprevious<cr>", desc = "tab prev" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- ["go"] = { "<C-o>", desc = "ctrl+o" },
    -- ["gO"] = { "<C-i>", desc = "ctrl+i" },
    -- ["s"] = { "<cmd>HopChar2MW<cr>", desc = "Hop Word" },
    -- ["<leader>gp"] = { "<cmd>Octo pr list<cr>", desc = "open pull request" },
    -- ["<leader>aors"] = { "<cmd>Octo review start<cr>", desc = "Octo review start" },
    -- ["<leader>aorS"] = { "<cmd>Octo review submit<cr>", desc = "Octo review submit" },
    -- ["<leader>aorr"] = { "<cmd>Octo review resume<cr>", desc = "Octo review resume" },
    -- ["<leader>aord"] = { "<cmd>Octo review discard<cr>", desc = "Octo review discard" },
    -- ["<leader>aorc"] = { "<cmd>Octo review close<cr>", desc = "Octo review close" },
    -- ["<leader>aopc"] = { "<cmd>Octo pr create<cr>", desc = "Octo pr create" },
    ["<leader>as"] = { "<cmd>AstroReload<cr>", desc = "Astronvim Reload" },
    -- ["<leader><leader>"] = { '<C-w>w', desc = "switch window" },
    ["<leader>ae"] = {
      function()
        combo("G?exports =<CR>")
      end,
      desc = 'find exports function',
    },
    ["<leader>ay"] = {
      function()
        combo("G?exports =<CR>VGy")
      end,
      desc = 'find exports function',
    },
    -- ["<leader>al"] = { '<cmd>Git log --graph --all<CR>', desc = "git graph" },
    -- ["<leader>ad"] = { function()
    --   local word = vim.fn.expand("<cword>",
    --   vim.cmd("wincmd c")
    --   vim.cmd("Gvdiffsplit " .. word)
    --   vim.cmd("wincmd w")
    -- end, desc = "Gvdiffsplit for current file" },
    -- ["<leader>aD"] = { "<cmd>DiffviewClose<CR>", desc = "DiffviewOpen HEAD..<word>" },
    ["<leader>adh"] = { function()
      local word = vim.fn.expand("<cword>")
      vim.cmd("wincmd c")
      vim.cmd("DiffviewOpen " .. word .. "..HEAD")
      vim.cmd("wincmd w")
    end, desc = "DiffviewOpen <word>..HEAD" },
    ["<leader>add"] = { function()
      local word = vim.fn.expand("<cword>")
      vim.cmd("wincmd c")
      vim.cmd("DiffviewOpen " .. word)
      vim.cmd("wincmd w")
      -- go to next window
      vim.cmd("wincmd w")
    end, desc = "DiffviewOpen <word>" },
    ["<leader>gd"] = { function()
      vim.cmd("DiffviewOpen")
    end, desc = "DiffviewOpen for merging" },
    ["<leader>atd"] = { function()
      -- get whole current line
      local current_line = vim.fn.getline(".")
      -- get word following pattern \<[0-9a-f]\{7,\}\>
      local word = vim.fn.matchstr(current_line, "\\<[0-9a-f]\\{7,\\}\\>")
      vim.cmd("wincmd c")
      vim.cmd("DiffviewOpen " .. word)
      vim.cmd("wincmd w")
      -- go to next window
      vim.cmd("wincmd w")
    end, desc = "DiffviewOpen from graph" },
    -- flutter -------------------------
    -- flutter -------------------------
    -- flutter -------------------------
    ["<leader>tw"] = { "<cmd>DiffviewClose<cr>", desc = "diff view close" },
    ['<leader>a,'] = {
      function()
        combo("yy?const<CR>kp<Esc>ciwfinal<Esc>g_r;h*0wwvnhcthis.<Esc>j")
      end,
      desc = 'make constructor',
    },
    ["<leader>ax"] = {
      function()
        combo(":.!zsh<CR>")
      end,
      desc = 'exec zsh command',
    },
    ["gl"] = {
      function()
        -- call code action menu
        require('code_action_menu').open_code_action_menu()
        -- await until code action menu is open then require('hop').hint_char1()
        -- vim.defer_fn(function()
        --   require('hop').hint_char1()
        -- end, 100)
        combo('jjj')
      end,
      desc = "Code Action",
    },
    -- [",r"] = {
    --   test()
    --     -- open reference for current symbol
    --     require('telescope.builtin').lsp_references()
    --     -- await until the menu is open
    --     vim.defer_fn(function()
    --       -- type "code"
    --       -- vim.api.nvim_feedkeys("jjx", "n", true)
    --       vim.cmd("normal jjx")
    --       -- go to normal mode
    --       vim.cmd("stopinsert")
    --     end, 100)
    --   end,
    --   desc = "lsp reference",
    -- },
    -- recursive
    ["<leader>afd"] = { "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
    ["<leader>aff"] = { "<cmd>!open .<cr>", desc = "open current dir" },
    ['<leader>afe'] = { "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulator" },
    ['<leader>afD'] = { "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
    ['<leader>afr'] = { "<cmd>FlutterReload<cr>", desc = "Flutter Reload" },
    ['<leader>afq'] = { "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
    ['<leader>afR'] = { "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
    ['<leader>afod'] = { "<cmd>FlutterOpenDevTools<cr>", desc = "Flutter Open DevTools" },
    ['<leader>ap'] = { "<cmd>call gitgutter#hunk#preview()<cr>", desc = "Hunk Preview" },
    -- flutter -------------------------
    -- flutter -------------------------
    -- flutter -------------------------
    -- leader a b for telescope diagnostic
    ['<leader>ab'] = { "<cmd>Telescope diagnostics<cr><esc>", desc = "Telescope diagnostics" },
    -- ["<leader>m"] = {
    --   ":e#<CR>", desc = "go to previous file"
    -- },
    ["<leader>m"] = { "<cmd>tabNext<cr>", desc = "tab next" },
    -- ["-N"] = { '*N', desc = "show same word" },
    -- ["-n"] = { '*', desc = "next same word" },
    ["<leader>ge"] = { "<cmd>Gitsigns next_hunk<cr>", desc = "next hunk" },
    ["-D"] = { "<cmd>Gitsigns prev_hunk<cr>", desc = "prev hunk" },
    ["<leader>gP"] = { "<cmd>Git pull origin main<cr>", desc = "pull from main" },
    --- key binding
    -- ["H"] = { "0", desc = "go to first char" },
    -- ["L"] = { "$", desc = "go to last char" },

    -- ga to $%
    -- ["ga"] = { "$h%", desc = "last then %" },
    ["gA"] = { "%", desc = "%" },
    -- function
    ["<F12>"] = {
      function()
        combo("<leader>q")
      end,
      desc = "next warning"
    },
    ["<leader>gg"] = {
      "<cmd>GV --all<CR>",
      desc = "GV"
    },
    -- ["<F8>"] = {
    --   "zz",
    --   desc = "GV"
    -- },
    ["gx"] = {
      function()
        -- go to next error using vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        -- get all errors
        local error = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        -- get all warnings
        local warning = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

        -- if error is not empty
        if next(error) ~= nil then
          -- go to next error
          vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
        elseif next(warning) ~= nil then
          -- go to next warning
          vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
        end
      end,
      desc = "next warning"
    },
    -- gX prev of gx
    ["gX"] = {
      function()
        -- go to next error using vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        -- get all errors
        local error = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        -- get all warnings
        local warning = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

        -- if error is not empty
        if next(error) ~= nil then
          -- go to next error
          vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
        elseif next(warning) ~= nil then
          -- go to next warning
          vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
        end
      end,
      desc = "next warning"
    },
    -- leader gx to run "dart analyze|grep error" and show result as a new window
    ["<leader>gx"] = {
      function()
        -- run dart analyze|grep error
        local result = vim.fn.systemlist("dart analyze|grep error")
        -- open new window
        vim.cmd("vnew")
        -- set buffer to result
        vim.api.nvim_buf_set_lines(0, 0, -1, false, result)
        -- set filetype to dart
        vim.api.nvim_buf_set_option(0, "filetype", "dart")
        -- set readonly
        vim.api.nvim_buf_set_option(0, "readonly", true)
        -- set buftype to nofile
        vim.api.nvim_buf_set_option(0, "buftype", "nofile")
      end,
      desc = "dart analyze|grep error"
    },
    ["<leader>s"] = { "<cmd>AerialNavToggle<CR>", desc = "AerialToggle" },
    -- ["<leader>al"] = { "<cmd>FlutterLspRestart<CR>", desc = "Telescope repo" },
    -- ["<leader>fR"] = { "<cmd>Telescope repo<CR>", desc = "Telescope repo" },
    ["<leader>aad"] = { "<cmd>e ~/.config/nvim/snippets/dart.snippets<CR>", desc = "dart snippets" },
    ["<leader>aaj"] = { "<cmd>e ~/.config/nvim/snippets/javascript.snippets<CR>", desc = "js snippets" },


    ["<leader>aar"] = {
      function ()
         require("luasnip.loaders.from_snipmate").load({ path = { "~/.config/nvim/snippets/" } })
      end,
      desc = "reload all snippets"
    },
    ["<leader>al"] = {
      function()
        -- copy current word at cursor
        local word = vim.fn.expand("<cword>")

        -- paste to next line in this pattern "console.log(' 🧪 xxx----->word', JSON.stringify(word, null, 2));"; without using combo()
        vim.cmd("normal oconsole.log(' 🧪 xxx----->" .. word .. "', JSON.stringify(" .. word .. ", null, 2));")
      end
      , desc = "js log" },
    ["<leader>aL"] = {
      function()
        -- copy current word at cursor
        local word = vim.fn.expand("<cword>")

        -- paste to next line in this pattern "console.log(' 🧪 xxx----->word', JSON.stringify(word, null, 2));"; without using combo()
        vim.cmd("normal oconsole.log(' 🧪 xxx-----> " .. word  )
      end
      , desc = "js log" },
    ["<leader>vv"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", desc = "mapping nvim" },
    ["<leader>vm"] = { "<cmd>tabnew ~/.config/nvim/lua/user/mappings.lua<CR>", desc = "mapping nvim" },
    -- ["<leader>vg"] = { "<cmd>e ../../../README.groovy<CR>", desc = "groovy" },
    ["<leader>vj"] = { "<cmd>vs ~/.config/nvim/lua/user/plugins/user.lua<CR>", desc = "plugin nvim" },
    -- map leader j to telescope search command
    -- ["<leader>W"] = { "<cmd>Telescope live_grep<CR>", desc = "find word" },
    ["<leader>ww"] = {
      function()
        -- go to ~/projects/daily/index.md
        vim.cmd("vs ~/projects/daily/index.md")
      end, desc = "go to daily/index.md" },
    ["<leader>wt"] = {
      function()
        -- go to ~/projects/daily/index.md
        vim.cmd("vs ~/projects/dbdiagram/main.groovy")
      end, desc = "go to daily/main.groovy" },
    ["<leader>wi"] = {
      function()
        vim.cmd("vs ~/projects/songkarn/functions/conm/requirements_for_cart_system/index.md")
      end, desc = "go to cart_system/index.md" },
    ["<leader>wu"] = {
      function()
        -- go to ~/projects/daily/index.md
        vim.cmd("vs ~/projects/songkarn/utils.js")
      end, desc = "go to songkarn/utils.js" },
    ["<leader>wm"] = {
      function()
        local current_bufnr = vim.fn.bufnr()
        vim.cmd("tabnew")
        vim.cmd("buffer " .. current_bufnr)
      end, desc = "wind max" },
    ["<leader>wf"] = {
      function()
        combo('<C-w>=')
      end, desc = "wind equal" },
    -- ["<leader>t"] = {
    --   function ()
    --     -- split terminal to right
    --     combo('<C-w>h')
    --   end, desc = "wind equal" },
    -- map F1 to Telescope commands
    ["<F1>"] = { "<cmd>Telescope commands<CR>", desc = "Telescope commands" },
    -- map ga to back to previous file
    ["ga"] = { "<cmd>e#<CR>", desc = "previous file" },
    ["gG"] = { "?start testing<CR>", desc = "go to first testing" },
    -- map gf to Format
    ["gf"] = { "<cmd>Format<CR>", desc = "Format" },
    --
    ["<leader>ac"] = { "<cmd>Telescope command_history<CR>", desc = "command history" },
    -- map gn to GitGutterNextHunk
    ["go"] = { "<cmd>Gitsigns next_hunk<CR>", desc = "next hunk" },
    -- map leader j to <cmd>SessionManager! load_session<cr>
    ["<leader>j"] = { "<cmd>SessionManager! load_session<cr>", desc = "load session" },
    -- map leader l to lazygit
    ["<leader>l"] = { "<cmd>LazyGit<CR>", desc = "lazygit" },
    -- map leader a t v to terminal
    -- ["<leader>t"] = { "<cmd>terminal<CR>", desc = "terminal v" },

    ["<leader>an"] = {
      function()
        -- run command tn on zsh

        local result = vim.fn.systemlist('clear; node test > ~/.nvim.temp.md; echo "done->~/.nvim.temp.md";')

        vim.cmd("tabnew ~/.nvim.temp.md")
        vim.cmd("vsplit ~/.nvim.temp.md")
        -- vim.cmd("vsplit ~/.nvim.temp.md")
        combo('/exp<CR>zt<C-h>gg/res<CR>zt<CR>')
      end, desc = "go to .nvim.temp.md" },
    ["<leader>t"] = {
      function()
        local current_dir = vim.fn.expand("%:p:h")
        combo("\\")
        -- combo("<cmd>terminal<CR>a")
        -- term cd current_dir && zsh
        combo("<cmd>term cd " .. current_dir .. " && zsh<CR>a")
      end,
      desc = "terminal v"
    },
    -- map gb to gitblame
    ["gb"] = { "<cmd>Git blame<cr>", desc = "Git blame" },
    -- map gt to DiffviewOpen
    ["gt"] = { "<cmd>DiffviewOpen<CR>", desc = "DiffviewOpen" },
    ["gr"] = {
      function()
        combo("\\gd")
      end,
      desc = "new win"
    },
    -- map leader w h to swap window to left
    ["<leader>wh"] = { "<C-w>h", desc = "swap window to left" },
    ["L"] = { ":bnext<CR>", desc = "bnext" },
    ["H"] = { ":bprevious<CR>", desc = "bprevious" },
    -- leader h n to split vertical window
    -- hoo
    ["gH"] = { ':lua require("harpoon.mark").add_file()<CR>', desc = "harpoon add_file" },
    -- gh to harpoon quick pick
    ["gh"] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "harpoon quick pick" },
    ['<leader>gn'] = { function()
      combo('<C-w>vgdzz')
    end, desc = "split vertical window" },
    -- B to ctl+d
    -- M to ctl+u
    ['B'] = { '<C-d>', desc = "scroll down" },
    ['W'] = { '<C-u>', desc = "scroll up" },
    -- leader l g to run :!dart format -l 120 currentFileName
    -- ['<leader>lg'] = {
    --   function()
    --     local currentFileName = vim.fn.expand("%:p")
    --     vim.cmd("silent !dart format -l 120 " .. currentFileName)
    --     -- for all files -- not only current file
    --     -- vim.cmd("!dart format -l 120 .")
    --     -- vim.cmd("redraw!")
    --   end, desc = "dart format",
    -- },
    -- ['<leader>gP'] = {
    --   function()
    --     local result = vim.fn.systemlist(
    --       'echo "consumer"; gh pr list --repo https://github.com/PENGKIE/consumer; echo "pengkie_utility"; gh pr list --repo  https://github.com/PENGKIE/pengkie_utility')
    --     print('res' .. vim.inspect(result))
    --   end, desc = "gh pr list [consumer, p_util]",
    -- },
    ['<leader>amp'] = {
      function()
        vim.cmd(":put =expand('%:p')")
      end, desc = "full_path",
    },
    -- use <C-r>% instead
    -- ['<leader>amn'] = {
    --   function()
    --     vim.cmd(":put =expand('%:t')")
    --   end, desc = "file_name",
    -- },
    ['<leader>amh'] = {
      function()
        vim.cmd(":put =expand('%:p:h')")
      end, desc = "file_dir",
    },
    ['<leader>amt'] = {
      function()
        -- get current word
        local word = vim.fn.expand("<cword>")
        -- search for word using /
        combo("/Table " .. word .. "<CR>")
      end, desc = "table.*",
    },
    ['<leader>ame'] = {
      function()
        -- get current word
        local word = vim.fn.expand("<cword>")
        -- search for word using /
        combo("/enum " .. word .. "<CR>")
      end, desc = "enum.*",
    },
    ['<leader>amf'] = {
      function()
        vim.cmd('!prettier --write "/Users/walter/projects/songkarn/**/*.js"')
      end, desc = "prettier songkarn folder",
    },
    ['<leader>aga'] = {
      function()
        --- run command two commands
        -- "gh pr merge --auto --merge"
        -- "gh pr review --approve"
        -- and show the result in bottom of current window
        local result = vim.fn.systemlist("gh pr merge --auto --merge && gh pr review --approve")
        -- local result = vim.fn.systemlist("gh pr merge --auto --merge")
        -- print table
        print('result is ' .. vim.inspect(result))
      end, desc = "gh pr approve",
    },
    ['<leader>ah'] = {
      function()
        vim.lsp.buf.hover()
      end,
      desc = 'show hover',
    },
    -- ['<leader>lG'] = {
    --   function()
    --     -- local currentFileName = vim.fn.expand("%:p")
    --     -- vim.cmd("silent !dart format -l 120 " .. currentFileName)
    --     -- for all files -- not only current file
    --     vim.cmd("!dart format -l 120 .")
    --     -- vim.cmd("redraw!")
    --   end, desc = "dart format all",
    -- },
    ['yl'] = {
      function()
        combo('yrr')
      end,
      desc = "yank line"
    },
    ['yw'] = {
      function()
        combo('yirw')
      end,
      desc = "yank word"
    },
    ['yb'] = {
      function()
        combo('yirb')
      end,
      desc = "yank ()"
    },
    ['yB'] = {
      function()
        combo('yirB')
      end,
      desc = "yank {}"
    },
    ["y'"] = {
      function()
        combo("yir'")
      end,
      desc = "yank '"
    },
    ['y"'] = {
      function()
        combo('yir"')
      end,
      desc = 'yank "'
    },
    ['yd'] = {
      function()
        combo('diwhyirw')
      end,
      desc = "yank line"
    },
    ['<leader>aaa'] = {
      function()
        -- call :VimwikiToggleListItem using cmd
        vim.cmd("VimwikiToggleListItem")
      end,
      desc = "toggle list"

    },
    ['<leader>ak'] = {
      function()
        -- call :VimwikiToggleListItem using cmd
        combo('/\\/\\/ isSkip:<CR>')
      end,
      desc = "toggle list"
    },
    ['<leader>r'] = {
      function()
        -- lsp rename
        vim.lsp.buf.rename()
      end,
      desc = "toggle list"
    },
    [';'] = { ':', desc = "enter command mode" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -------- auto commit
    --   ["<leader>ac"] = { function()
    --     -- get whole line data with all space chars and replace them with "-"
    --     local line = vim.fn.getline("."):gsub("%s+", "-")
    --
    --     vim.cmd("normal dd")
    --     vim.cmd("w!")
    --     vim.cmd("Git add .")
    --     vim.cmd("Git commit -m \"" .. line .. "\"")
    --     -- vim.cmd("normal <CR>")
    --   end, desc = "Gcommit" },
    --   ["<leader>ax"] = { function()
    --     local text = vim.fn.input("Commit message: ")
    --     vim.cmd("normal i" .. text)
    --   end,
    --     desc = "test input"
    --   },
    --   ["<leader>aj"] = { function()
    --     -- insert new line like o
    --     vim.cmd("normal o")
    --     vim.cmd("normal o")
    --
    --     vim.cmd("normal i});")
    --     vim.cmd("normal hhk")
    --     -- go to insert mode
    --     vim.cmd("startinsert")
    --   end,
    --     desc = "replace });"
    --   },
    ------------------------------------------------------------
  },
  i = {
    -- type jk to go to the last of line like $
    ["jk"] = { "<esc>A", desc = "go to the last of line" }, -- this key is not working
    [">"] = { ">gv", desc = "indent" }, -- this key is not working
    -- ["<Tab>"] = function()
    --   if require("copilot.suggestion").is_visible() then
    --     require("copilot.suggestion").accept()
    --   else
    --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    --   end
    -- end,
    ["<C-x><C-x>y"] = function()
      vim.cmd("stopinsert")
      combo('yirw')
    end,
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    -- map esc to close term


    -- ["<leader>g"] = { "<C-\\><C-n>", desc = "close term" },
    ["<C-g>"] = { "<C-\\><C-n>", desc = "close term" },
    -- map leader , to close term
    -- ["<leader>,"] = { "<C-\\><C-n>", desc = "close term" },

  },
  v = {
    ["("] = {
      function()
        -- add () to current word
        -- go to start char
        -- go to insert mode then i
      end,
      desc = "add () to current word",
    },
    ["{"] = {
      function()
        combo('g_%')
      end,
      desc = "xxx",
    },
    ["x"] = {
      function()
        local mode = vim.api.nvim_exec("echo mode()", true)
        if mode == "V" then
          combo("g_%o")
        else
          combo("g_")
        end
      end,
      desc = "last char, line",
    },
    ['X'] = {
      function ()
          combo("g_%")
      end,
      desc = 'last char, last'
    },
    -- ["<esc>"] = false,
    -- s to use HopChar1
    -- ["s"] = { "<cmd>HopChar1<cr>", desc = "Hop Word" },
    -- ["ga"] = { "$%", desc = "last then %" },
    --- 1
    --- 2
    --- 3
    -- ["<F8>"] = { "<Esc>", desc = "esc" },


    --- 3
    --- 3
    --- 3

    --- 1
    --- 2
  },
}
