vim.o.clipboard = 'unnamedplus'
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- case sensitive search
vim.o.ignorecase = true


-- this is mappings.lua for nvim

-- map leader to space
vim.g.mapleader = " "

-- for testing
-- map aa to j
-- vim.api.nvim_set_keymap("n", "aa", "j", { noremap = true })

local combo = function(str)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), 'm', true)
end

local opts = { silent = true, remap = false }

--- vscode
--- vscode
--- vscode
--- vscode
--- vscode
--- vscode
--
-- map leader vs to run this command in vscode "workbench.action.openGlobalKeybindings"
vim.api.nvim_set_keymap("n", "<leader>vs", "<cmd>call VSCodeNotify('workbench.action.openGlobalKeybindings')<cr>", { noremap = true })

-- map leder vj to workbench.action.openSettingsJson
vim.api.nvim_set_keymap("n", "<leader>vj", "<cmd>call VSCodeNotify('workbench.action.openSettingsJson')<cr>", { noremap = true })

-- map leader vz to run workbench.action.toggleZenMode
vim.api.nvim_set_keymap("n", "<leader>vz", "<cmd>call VSCodeNotify('workbench.action.toggleZenMode')<cr>", { noremap = true })

-- map leader vm to run code ~/.config/nvim/lua
vim.keymap.set("n", "<leader>vm",
  function ()
        vim.cmd('!code ~/.config/nvim/lua/vscode/mappings.lua')
  end
  ,opts)

-- map leader vv to open-in-vim.open
vim.api.nvim_set_keymap("n", "<leader>vv", "<cmd>call VSCodeNotify('open-in-vim.open')<cr>", { noremap = true })

--- terminal
--- terminal
--- terminal
--- terminal
--- terminal
--
-- map leader ii to let function open terminal
-- vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<cr>", { noremap = true })

-- vim.keymap.set("n", "<leader>tl", function()
--   -- vim.fn.system('#!/bin/bash\necho "hi sk" > ~/.temp.nvim.sh')
--   -- vim.cmd('!chmod +x ~/.temp.nvim.sh; open -a iTerm ~/.temp.nvim.sh; sleep 5')
--   vim.cmd('!open -a iTerm')
-- end, opts)

-- workbench.action.toggleMaximizedPanel

-- -- map page-down to 20jj
-- vim.api.nvim_set_keymap("n", "<PageDown>", "20j", { noremap = true })
--
-- -- k
-- -- map page-up to 20kk
-- vim.api.nvim_set_keymap("n", "<PageUp>", "20k", { noremap = true })



--- git
--- git
--- git
--- git
--- git

-- map leader gp to pr:github.focus

vim.keymap.set("n", "<leader>gp",
  function ()
    vim.cmd("call VSCodeNotify('pr:github.focus')")
    vim.cmd("call VSCodeNotify('pr.refreshList')")
  end
  ,opts)

-- map gb to gitlens.toggleFileBlame 
vim.api.nvim_set_keymap("n", "gb", "<cmd>call VSCodeNotify('gitlens.toggleFileBlame')<cr>", { noremap = true })

vim.keymap.set("n", "<leader>ga",
  function ()
        local result = vim.fn.systemlist("gh pr merge --auto --merge && gh pr review --approve")

        -- write result to .temp.nvim.txt
        vim.fn.system('echo "' .. table.concat(result, "\n") .. '" > ~/.temp.nvim.txt')

        -- open .temp.nvim.txt
        vim.cmd('!code ~/.temp.nvim.txt')
  end
  ,opts)

-- map leader gl to run this command 'gl > ~/.gl.temp; code ~/.gl.temp' 
vim.keymap.set("n", "<leader>gl", function()
  -- run this command 'gl > ~/.gl.temp; code ~/.gl.temp'
  vim.fn.system('Git Log > ~/.temp.nvim.txt')
  vim.fn.system('git log --date=relative --graph --pretty=format:"%C(yellow)%d %C(white)%ad %C(magenta)UU%an %C(green)%h -> %C(blue)%s" --all --decorate --abbrev-commit >> ~/.temp.nvim.txt')
  -- replace all "origin/" in .temp.nvim.txt with "#FF5CFA"
  -- vim.fn.system('sed -i "" "s/(origin\\//(\\#FF5CFA org\\/ /g" ~/.temp.nvim.txt')

  vim.cmd('!code ~/.temp.nvim.txt')
end, opts)
-- map leader gg to git-graph.view
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>call VSCodeNotify('git-graph.view')<cr>", { noremap = true })

-- map leader gd to gitlens.diffWithPrevious
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>call VSCodeNotify('gitlens.diffWithPrevious')<cr>", { noremap = true })



--- editor
--- editor
--- editor
--- editor
--- editor
--- editor
--
-- map leader jj to workbench.action.togglePanel
vim.api.nvim_set_keymap("n", "<leader>jj", "<cmd>call VSCodeNotify('workbench.action.togglePanel')<cr>", { noremap = true })
-- map leader q to workbench.action.closeWindow
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>", { noremap = true })
-- map leader w to workbench.action.files.save
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>call VSCodeNotify('workbench.action.files.save')<cr>", { noremap = true })
-- map leader c to workbench.action.closeAllEditors 
vim.keymap.set("n", "<leader>c",
  function ()
    vim.cmd('call VSCodeNotify("workbench.action.closeAllEditors")')
    vim.cmd('sleep 300m')
-- welcome.showNewFileEntries
    vim.cmd('call VSCodeNotify("welcome.showNewFileEntries"')
    combo("<Esc>")
  end
  ,opts)

vim.keymap.set("n", "<leader>gn",
  function ()
    vim.cmd("call VSCodeNotify('workbench.action.splitEditorRight)")
    vim.cmd('sleep 300m')
    combo("*")
  end
  ,opts)

-- map \ to workbench.action.splitEditorRight
vim.api.nvim_set_keymap("n", "\\", "<cmd>call VSCodeNotify('workbench.action.splitEditorRight')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "|", "<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<cr>", { noremap = true })



-- map ledaer m to run :e#<CR>
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>e#<cr>", { noremap = true })

--map H as 0
--map L as $
--map ga as $h%
--map gA as %
vim.api.nvim_set_keymap("n", "H", "0", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })
vim.api.nvim_set_keymap("n", "ga", "$h%", { noremap = true })
vim.api.nvim_set_keymap("n", "gA", "%", { noremap = true })
-- vim.api.nvim_set_keymap("n", "cx", "cxiw", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gn", "*", { noremap = true })

--- map gc in normal mode as editor.action.commentLine
vim.api.nvim_set_keymap("n", "gc", "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>", { noremap = true })


vim.keymap.set("n", "gr",
  function ()
    combo("\\gdzz")
  end
  ,opts)


--- g navigation
--- g navigation
--- g navigation
--- g navigation
--- g navigation


vim.keymap.set("n", "gx",
  function ()
    -- go to insert mode
    vim.cmd('startinsert')
    -- run go
    vim.cmd('call VSCodeNotify("editor.action.marker.next")')
    -- delay 150 ms before go to normal mode
    vim.cmd('sleep 300m')
    -- go to normal mode
    vim.cmd('stopinsert')
  end
  ,opts)
vim.keymap.set("n", "go",
  function ()
    -- go to insert mode
    vim.cmd('startinsert')
    -- run go
    vim.cmd('call VSCodeNotify("workbench.action.editor.nextChange")')
    -- delay 150 ms before go to normal mode
    vim.cmd('sleep 300m')
    -- go to normal mode
    vim.cmd('stopinsert')
  end
  ,opts)
--- map gn to  
vim.keymap.set("n", "gn",
  function ()
    -- go to insert mode
    vim.cmd('startinsert')
    -- run gn
    vim.cmd('call VSCodeNotify("workbench.action.compareEditor.nextChange")')
    -- delay 150 ms before go to normal mode
    vim.cmd('sleep 300m')
    -- go to normal mode
    vim.cmd('stopinsert')
  end
     ,opts)
  


--- lsp
--- lsp
--- lsp
--- lsp
--- lsp
--- lsp
-- map leader lh to editor.action.showHover
vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>call VSCodeNotify('editor.action.showHover')<cr>", { noremap = true })

-- map leader ll to format document
vim.api.nvim_set_keymap("n", "gf", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { noremap = true })

-- map leader la to editor.action.quickFix
-- vim.api.nvim_set_keymap("n", "<leader>la", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gl", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>", { noremap = true })

-- map leader lr to editor.action.rename
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>call VSCodeNotify('editor.action.rename')<cr>", { noremap = true })

--- debug
--- debug
--- debug
--- debug
--- debug
--- debug

-- map leader dd to workbench.action.debug.start
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>call VSCodeNotify('workbench.action.debug.start')<cr>", { noremap = true })

-- map leader dr to workbench.action.debug.restart
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>call VSCodeNotify('workbench.action.debug.restart')<cr>", { noremap = true })

-- map leader ds to workbench.action.debug.stop
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>call VSCodeNotify('workbench.action.debug.stop')<cr>", { noremap = true })

-- map leader dv to flutter.selectDevice
vim.api.nvim_set_keymap("n", "<leader>dv", "<cmd>call VSCodeNotify('flutter.selectDevice')<cr>", { noremap = true })  


-- util
-- util
-- util
-- util
-- util
-- util



-- map GG to workbench.action.reloadWindow
vim.api.nvim_set_keymap("n", "<leader>ar", "<cmd>call VSCodeNotify('workbench.action.reloadWindow')<cr>", { noremap = true })

-- map leader aam to mdx-preview.commands.openPreview
vim.api.nvim_set_keymap("n", "<leader>aam", "<cmd>call VSCodeNotify('markdown.showPreview')<cr>", { noremap = true })

-- map leader ae to find exports =
vim.keymap.set("n", "<leader>ae",
  function ()
    combo("G?exports =<CR>")
  end
  ,opts)
  
-- map leader ay to find exports = and copy
vim.keymap.set("n", "<leader>ay",
  function ()
    combo("G?exports =<CR>VGy")
  end
  ,opts)
  
 -- map leader a, to handle comma
vim.keymap.set("n", "<leader>a,",
  function ()
    combo("yy?const<CR>kp<Esc>ciwfinal<Esc>$r;hgnhv?required<CR>elc this.<Esc>2j<leader>ll")
  end
  ,opts)
 -- map leader an to next of diff in vscode
vim.keymap.set("n", "<leader>an",
  function ()

    combo("<C-h>j")
  end
  ,opts)

vim.keymap.set("n", '<leader>av',
  function ()
    combo('V%')
  end
  ,opts)
vim.keymap.set("n", "<leader>ad",
  function ()
      -- get whole current line 
      local current_line = vim.fn.getline(".")
      -- get word following pattern \<[0-9a-f]\{7,\}\>
      local word = vim.fn.matchstr(current_line, "\\<[0-9a-f]\\{8,\\}\\>")
    -- copy to clipboard
    vim.fn.setreg("+", word)

    -- run call VSCodeNotify('gitlens.compareHeadWith')<cr>
    vim.cmd('call VSCodeNotify("gitlens.compareHeadWith")')
  end
  ,opts)
  
-- map gm to vscode-harpoon.addEditor
vim.api.nvim_set_keymap("n", "gm", "<cmd>call VSCodeNotify('vscode-harpoon.addEditor')<cr>", { noremap = true })
-- map gh to vscode-harpoon.editorQuickPick
vim.api.nvim_set_keymap("n", "gh", "<cmd>call VSCodeNotify('vscode-harpoon.editorQuickPick')<cr>", { noremap = true })

-- map leader tv to workbench.action.createTerminalEditor
-- vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>call VSCodeNotify('workbench.action.createTerminalEditor')<cr>", { noremap = true })
vim.keymap.set("n", "<leader>tv",
  function ()
    vim.cmd("call VSCodeNotify('workbench.action.createTerminalEditor')")
  end
  ,opts)


-- source
vim.api.nvim_set_keymap("n", "<leader>ss", "<cmd>source<cr>", { noremap = true })



-- map leader kl to workbench.action.moveActiveEditorGroupRight
vim.api.nvim_set_keymap("n", "<leader>kl", "<cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<cr>", { noremap = true })
-- map leader kh to workbench.action.moveActiveEditorGroupLeft
vim.api.nvim_set_keymap("n", "<leader>kh", "<cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<cr>", { noremap = true })




-- map leap spooky yir
vim.keymap.set("n", "yw",
  function ()
    combo("yirw")
  end
  ,opts)
vim.keymap.set("n", "yb",
  function ()
    combo("yirb")
  end
  ,opts)
vim.keymap.set("n", "yB",
  function ()
    combo("yirB")
  end
  ,opts)
vim.keymap.set("n", "y'",
  function ()
    combo("yir'")
  end
  ,opts)
vim.keymap.set("n", 'y"',
  function ()
    combo('yir"')
  end
  ,opts)

-- map leap spooky cim
vim.keymap.set("n", "cw",
  function ()
    combo("cimw")
  end
  ,opts)
vim.keymap.set("n", "cb",
  function ()
    combo("cimb")
  end
  ,opts)
vim.keymap.set("n", "cB", 
  function ()
    combo("cimB")
  end
  ,opts)
vim.keymap.set("n", "c'",
  function ()
    combo("cim'")
  end
  ,opts)
vim.keymap.set("n", 'c"',
  function ()
    combo('cim"')
  end
  ,opts)
  
-- map leap spooky dir
vim.keymap.set("n", "dw",
  function ()
    combo("dirw")
  end
  ,opts)
vim.keymap.set("n", "db",
  function ()
    combo("dirb")
  end
  ,opts)
vim.keymap.set("n", "dB",
  function ()
    combo("dirB")
  end
  ,opts)
vim.keymap.set("n", "d'",
  function ()
    combo("dir'")
  end
  ,opts)
vim.keymap.set("n", 'd"',
  function ()
    combo('dir"')
  end
  ,opts)

  

--[[ 
  
tester

  const MenuItemWidget({
    super.key,
    required this.iconData,
    required this.title,
    required String text,
  )}

  ]]


--- ui
--- ui
--- ui
--- ui
--- ui
--- ui
-- map leader gf to workbench.action.toggleMaximizedPanel
vim.api.nvim_set_keymap("n", "<leader>uf", "<cmd>call VSCodeNotify('workbench.action.toggleMaximizedPanel')<cr>", { noremap = true })

-- map leader ud to workbench.panel.repl.view.focus
vim.api.nvim_set_keymap("n", "<leader>ud", "<cmd>call VSCodeNotify('workbench.panel.repl.view.focus')<cr>", { noremap = true })

-- map leader up to workbench.action.problems.focus
vim.api.nvim_set_keymap("n", "<leader>up", "<cmd>call VSCodeNotify('workbench.action.problems.focus')<cr>", { noremap = true })

-- map leader uh to todohighlight.toggleHighlight
vim.api.nvim_set_keymap("n", "<leader>uh", "<cmd>call VSCodeNotify('todohighlight.toggleHighlight')<cr>", { noremap = true })

-- map leader e to workbench.action.to ggleSidebarVisibility
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>", { noremap = true })

-- map leader o to workbench.files.action.focusFilesExplorer
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<cr>", { noremap = true })

--- find
--- find
--- find
--- find

-- map leader ff to workbench.action.quickOpen
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>", { noremap = true })

-- map leader fs to workbench.action.gotoSymbol
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>", { noremap = true })

-- map leader fo to workbench.action.openRecent
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>call VSCodeNotify('workbench.action.openRecent')<cr>", { noremap = true })

-- map leader fn to workbench.action.quickSwitchWindow
vim.api.nvim_set_keymap("n", "<leader>fn", "<cmd>call VSCodeNotify('workbench.action.quickSwitchWindow')<cr>", { noremap = true })

  -- map leader fw to workbench.action.findInFiles
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>", { noremap = true })


-- visual mode
vim.api.nvim_set_keymap("v", "x", "$h%", { noremap = true })
vim.keymap.set("v", "gc",
  function ()
    -- run gc
    vim.cmd('call VSCodeNotify("editor.action.commentLine")')
    -- stop visual mode
    combo("<Esc>")
  end
  ,opts)