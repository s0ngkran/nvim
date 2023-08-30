if vim.g.vscode then
  -- packer.nvim configuration
  -- Ensure the plugin manager is initialized
  -- You can modify the installation path if desired
  local packer_installed_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(packer_installed_path)) > 0 then
      vim.cmd [[
          !git clone https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
          autocmd BufWritePost init.lua PackerCompile
          autocmd BufWritePost init.lua PackerLoad
      ]]
  end
  
  -- Packer commands
  -- Make sure to put your plugin configurations after this block

  -- Initialize Packer
  require('packer').startup(function()
      -- Load plugins
      use {
          "ggandor/leap.nvim",
          config = function() require("leap").set_default_keymaps() end,
        }

      use 'ggandor/leap-spooky.nvim'

      -- for remote vim screen
      -- use 'jbyuki/instant.nvim'
      
      -- harpoon
      use 'nvim-lua/plenary.nvim'
      use 'ThePrimeagen/harpoon'
      use 'tpope/vim-surround'
      use 'tommcdo/vim-exchange'

    --   use({
    --     "kylechui/nvim-surround",
    --     tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    --     config = function()
    --         require("nvim-surround").setup({
    --             -- Configuration here, or leave empty to use defaults
    --         })
    --     end
    -- })
 --   [more stuff]                dsr             more stuff
      -- "flash"
      -- use 'folke/flash.nvim'

      --- do not 'forget' to :PackerInstall
      --- do not forget to :PackerInstall
      --- do not forget to :PackerInstall
      --- do not forget to :PackerInstall
      --- do not forget to :PackerInstall
      -- ...
  end)

  -- for remote vim screen
  -- vim.g.instant_username = "SK-host"
  -- test commit
  
  -- vscode extension
  -- vscode extension
  -- vscode extension
  for _, source in ipairs {
    "vscode.mappings",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
  end

--- color
  vim.api.nvim_exec([[
      " THEME CHANGER
      function! SetCursorLineNrColorInsert(mode)
          " Insert mode: blue
          if a:mode == "i"
              call VSCodeNotify('nvim-theme.insert')

          " Replace mode: red
          elseif a:mode == "r"
              call VSCodeNotify('nvim-theme.replace')
          endif
      endfunction

      augroup CursorLineNrColorSwap
          autocmd!
          autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
          autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.normal')
          autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
          autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
          autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
      augroup END
  ]], false)
  
  vim.keymap.set('n', 's', function ()
    local current_window = vim.fn.win_getid()
    require('leap').leap { target_windows = { current_window } }
  end)


  require('leap-spooky').setup {
  -- Mappings will be generated corresponding to all native text objects,
  -- like: (ir|ar|iR|aR|im|am|iM|aM){obj}.
  -- Special line objects will also be added, by repeating the affixes.
  -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
  -- window.
  affixes = {
    -- The cursor moves to the targeted object, and stays there.
    magnetic = { window = 'm', cross_window = 'M' },
    -- The operation is executed seemingly remotely (the cursor boomerangs
    -- back afterwards).
    remote = { window = 'r', cross_window = 'R' },
  },
  -- Defines text objects like `riw`, `raw`, etc., instead of
  -- targets.vim-style `irw`, `arw`.
  prefix = false,
  -- The yanked text will automatically be pasted at the cursor position
  -- if the unnamed register is in use.
  paste_on_remote_yank = true,
}


else
  -- ordinary Neovim
  for _, source in ipairs {
    "astronvim.bootstrap",
    "astronvim.options",
    "astronvim.lazy",
    "astronvim.autocmds",
    "astronvim.mappings",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
  end

  if astronvim.default_colorscheme then
    if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
      require("astronvim.utils").notify(
        "Error setting up colorscheme: " .. astronvim.default_colorscheme,
        vim.log.levels.ERROR
      )
    end
  end

  require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
end
 
