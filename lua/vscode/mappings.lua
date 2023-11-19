
vim.o.clipboard = 'unnamedplus'
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- case sensitive search
vim.o.ignorecase = true


-- this is mappings.lua for nvim
--
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

-- do not delete me
-- -- map j to cursorDown
-- vim.api.nvim_set_keymap("n", "j", "<cmd>call VSCodeNotify('cursorDown')<cr>", { noremap = true })
-- -- map k to cursorUp
-- vim.api.nvim_set_keymap("n", "k", "<cmd>call VSCodeNotify('cursorUp')<cr>", { noremap = true })
-- map j to gj
-- vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
-- map k to gk
-- vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

-- map za to editor.toggleFold
vim.api.nvim_set_keymap("n", "za", "<cmd>call VSCodeNotify('editor.toggleFold')<cr>", { noremap = true })
-- -- map zm to editor.foldAll
vim.api.nvim_set_keymap("n", "zM", "<cmd>call VSCodeNotify('editor.foldAll')<cr>", { noremap = true })
-- map zr to editor.unfoldAll
vim.api.nvim_set_keymap("n", "zr", "<cmd>call VSCodeNotify('editor.unfoldAll')<cr>", { noremap = true })
-- map zo to editor.unfoldRecursively
vim.api.nvim_set_keymap("n", "zo", "<cmd>call VSCodeNotify('editor.unfoldRecursively')<cr>", { noremap = true })
-- map zc to editor.fold
vim.api.nvim_set_keymap("n", "zc", "<cmd>call VSCodeNotify('editor.fold')<cr>", { noremap = true })


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
vim.keymap.set("n", "<leader>vi",
  function ()
        vim.cmd('!code ~/.config/nvim/init.lua')
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

vim.keymap.set("n", "<leader>p",
  function ()
    vim.cmd("call VSCodeNotify('pr:github.focus')")
    vim.cmd("call VSCodeNotify('pr.refreshList')")
  end
  ,opts)

-- map gb to gitlens.toggleFileBlame 
vim.api.nvim_set_keymap("n", "gb", "<cmd>call VSCodeNotify('gitlens.toggleFileBlame')<cr>", { noremap = true })

vim.keymap.set("n", "<leader>gm",
  function ()
        local result = vim.fn.systemlist("gh pr merge --auto --merge && gh pr review --approve")

        -- write result to .temp.nvim.txt
        vim.fn.system('echo "' .. table.concat(result, "\n") .. '" > ~/.temp.nvim.txt')

        -- open .temp.nvim.txt
        vim.cmd('!code ~/.temp.nvim.txt')
  end
  ,opts)

  -- hoo a
vim.keymap.set("n", "<leader>an", function()
  local path = vim.fn.expand("%")
  vim.fn.system('echo "running" > ~/.temp.nvim.txt')
  vim.cmd('!code ~/.temp.nvim.txt')
  -- result = __vscode_neovim__-file:///Users/walter/projects/songkarn/functions/conm/c_get_promotion/func.js
  -- cut __vscode_neovim__-file://
  local result = vim.fn.systemlist("echo " .. path .. " | cut -c 26-")
  
  -- run node
  local out = vim.fn.system('node ' .. table.concat(result, "\n") .. ' > ~/.temp.nvim.txt')

end, opts)
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

-- map leader gc to workbench.action.terminal.newWithCwd
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>call VSCodeNotify('workbench.action.terminal.newWithCwd')<cr>", { noremap = true })

-- map leader gk to workbench.action.terminal.killAll
vim.api.nvim_set_keymap("n", "<leader>gk", "<cmd>call VSCodeNotify('workbench.action.terminal.killAll')<cr>", { noremap = true })

-- map leader gj to multiCommand.openTerminalForCurrentFile
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>call VSCodeNotify('multiCommand.openTerminalForCurrentFile')<cr>", { noremap = true })

-- map leader gd to gitlens.diffWithPrevious
vim.api.nvim_set_keymap("n", "gt", "<cmd>call VSCodeNotify('gitlens.diffWithPrevious')<cr>", { noremap = true })



--- editor
--- editor
--- editor
--- editor
--- editor
--- editor
--
-- map leader q to workbench.action.closeWindow
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>", { noremap = true })


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

-- map \ to workbench.action.splitEditorRight
vim.api.nvim_set_keymap("n", "\\", "<cmd>call VSCodeNotify('workbench.action.splitEditorRight')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "|", "<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<cr>", { noremap = true })


-- map ledaer m to editor.action.triggerSuggest



vim.api.nvim_set_keymap("n", "ga", "<cmd>call VSCodeNotify('multiCommand.openPreviousFile')<cr>", { noremap = true })

-- lazygit
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>call VSCodeNotify('multiCommand.lazygit')<cr>", { noremap = true })

--map H as 0
--map L as $
--map ga as $h%
--map gA as %
-- vim.api.nvim_set_keymap("n", "H", "0", { noremap = true })
-- vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })
-- vim.api.nvim_set_keymap("n", "ga", "$h%", { noremap = true })
-- vim.api.nvim_set_keymap("n", "cw", "cxiw", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gn", "*", { noremap = true })

-- map L to workbench.action.nextEditorInGroup
vim.api.nvim_set_keymap("n", "L", "<cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<cr>", { noremap = true })
-- map H to workbench.action.previousEditorInGroup
vim.api.nvim_set_keymap("n", "H", "<cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "zj", "L", { noremap = true })
vim.api.nvim_set_keymap("n", "zm", "M", { noremap = true })
vim.api.nvim_set_keymap("n", "zk", "H", { noremap = true })


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

-- map leader gf to format document
vim.api.nvim_set_keymap("n", "gf", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "gl", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>", { noremap = true })

-- map leader r to editor.action.rename
-- vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>call VSCodeNotify('editor.action.rename')<cr>", { noremap = true })

--- debug
--- debug
--- debug
--- debug
--- debug
--- debug

-- map leader dd to workbench.action.debug.start
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>call VSCodeNotify('workbench.action.debug.start')<cr>", { noremap = true })

-- map leader dr to workbench.action.debug.restart
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>call VSCodeNotify('flutter.hotRestart')<cr>", { noremap = true })


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

-- source
vim.api.nvim_set_keymap("n", "<leader>as", "<cmd>source<cr>", { noremap = true })
-- map leader ap to copyFilePath
vim.api.nvim_set_keymap("n", "<leader>ap", "<cmd>call VSCodeNotify('copyFilePath')<cr>", { noremap = true })

-- map leader ai to :PackerInstall
vim.api.nvim_set_keymap("n", "<leader>ai", ":PackerInstall<cr>", { noremap = true })

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

vim.keymap.set("n", 'gv',
  function ()
    combo('V%')
  end
  ,opts)

vim.keymap.set("n", "<leader>ac",
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

-- terminal
-- vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>call VSCodeNotify('workbench.action.createTerminalEditor')<cr>", { noremap = true })


-- map leader wl to workbench.action.moveActiveEditorGroupRight
vim.api.nvim_set_keymap("n", "<leader>wl", "<cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<cr>", { noremap = true })
-- map leader wh to workbench.action.moveActiveEditorGroupLeft
vim.api.nvim_set_keymap("n", "<leader>wh", "<cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<cr>", { noremap = true })
-- map leader wq to workbench.action.closeEditorsInGroup
vim.api.nvim_set_keymap("n", "<leader>wq", "<cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<cr>", { noremap = true })

-- map leader ww to workbench.action.files.save
vim.api.nvim_set_keymap("n", "<leader>ww", "<cmd>call VSCodeNotify('workbench.action.files.save')<cr>", { noremap = true })

    -- ['yd'] = {
    --   function()
    --     combo('diwhyirw')
    --   end,
    --   desc = "yank line"
    -- },
vim.keymap.set("n", "yd",
  function ()
    combo("diwhyirw")
  end
  ,opts)

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
vim.keymap.set("n", 'yl',
  function ()
    combo('yrr')
  end
  ,opts)

-- map leap spooky cim
vim.keymap.set("n", "cw",
  function ()
    combo("cirw")
  end
  ,opts)
vim.keymap.set("n", "cb",
  function ()
    combo("cirb")
  end
  ,opts)
vim.keymap.set("n", "cB", 
  function ()
    combo("cirB")
  end
  ,opts)
vim.keymap.set("n", "c'",
  function ()
    combo("cir'")
  end
  ,opts)
vim.keymap.set("n", 'c"',
  function ()
    combo('cir"')
  end
  ,opts)
vim.keymap.set("n", 'cl',
  function ()
    combo('crr')
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
vim.keymap.set("n", 'dl',
  function ()
    combo('drr')
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
-- vim.api.nvim_set_keymap("n", "<leader>uf", "<cmd>call VSCodeNotify('workbench.action.toggleMaximizedPanel')<cr>", { noremap = true })

-- map leader ud to workbench.panel.repl.view.focus
-- vim.api.nvim_set_keymap("n", "<leader>ud", "<cmd>call VSCodeNotify('workbench.panel.repl.view.focus')<cr>", { noremap = true })

-- map leader up to workbench.action.problems.focus
vim.api.nvim_set_keymap("n", "gp", "<cmd>call VSCodeNotify('workbench.action.problems.focus')<cr>", { noremap = true })

-- map leader uh to todohighlight.toggleHighlight
vim.api.nvim_set_keymap("n", "<leader>uh", "<cmd>call VSCodeNotify('todohighlight.toggleHighlight')<cr>", { noremap = true })

-- map leader e to workbench.action.to ggleSidebarVisibility
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>", { noremap = true })

-- map leader o to workbench.files.action.focusFilesExplorer
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<cr>", { noremap = true })

-- show hover
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<cr>", { noremap = true })

--- find
--- find
--- find
--- find

-- map leader f to workbench.action.quickOpen
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>", { noremap = true })

-- map leader s to workbench.action.gotoSymbol
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>", { noremap = true })

-- map leader R to workbench.action.openRecent
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>call VSCodeNotify('workbench.action.openRecent')<cr>", { noremap = true })

-- map leader b to workbench.action.quickOpenLeastRecentlyUsedEditor
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>call VSCodeNotify('workbench.action.showEditorsInActiveGroup')<cr>", { noremap = true })

-- map leader j to workbench.action.switchWindow
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>call VSCodeNotify('workbench.action.switchWindow')<cr>", { noremap = true })

-- map leader W to workbench.action.findInFiles
vim.api.nvim_set_keymap("n", "<leader>W", "<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>", { noremap = true })

-- map leader n to workbench.action.newWindow
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>call VSCodeNotify('workbench.action.newWindow')<cr>", { noremap = true })

-- map leader al to turboConsoleLog.displayLogMessage
vim.api.nvim_set_keymap("n", "<leader>al", "<cmd>call VSCodeNotify('turboConsoleLog.displayLogMessage')<cr>", { noremap = true })


-- map leader m to :lua require('treesj').split()
-- vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>lua require('treesj').split()<cr>", { noremap = true })
vim.keymap.set('n', '<leader>m', require('treesj').toggle)
vim.keymap.set('n', '<leader>M', function()
    require('treesj').toggle({ split = { recursive = true } })
end)


-- visual mode
vim.keymap.set("v", "gc",
  function ()
    -- run gc
    vim.cmd('call VSCodeNotify("editor.action.commentLine")')
    -- stop visual mode
    combo("<Esc>")
  end
  ,opts)
  
  
  -- jump to }
vim.keymap.set("v", "{",
  function ()
    combo("g_%")
  end
  ,opts)
  
  -- jump last char
vim.keymap.set("v", "x",
  function ()
    combo("g_")
  end
  ,opts)
  
  -- surround with ( word )
vim.keymap.set("n", "y(",
  function ()
    combo("ysiw(")
  end
  ,opts)

-- vim.api.nvim_set_keymap("v", "ga", "%V", { noremap = true })