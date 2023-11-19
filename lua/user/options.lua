-- set vim options here (vim.<first_key>.<second_key> = value)
-- " Easymotion options

-- return {
--   opt = {
--     -- set to true or false etc.
--     relativenumber = true, -- sets vim.opt.relativenumber
--     number = true,         -- sets vim.opt.number
--     spell = false,         -- sets vim.opt.spell
--     signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
--     wrap = false,          -- sets vim.opt.wrap
--   },
--   g = {
--     mapleader = " ",                 -- sets vim.g.mapleader
--     autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
--     cmp_enabled = true,              -- enable completion at start
--     autopairs_enabled = true,        -- enable autopairs at start
--     diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
--     icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
--     ui_notifications_enabled = true, -- disable notifications when toggling UI elements
--   },
-- }

-- If you need more control, you can use the function()...end notation
return function(local_vim)
  local_vim.opt.relativenumber = false
  local_vim.opt.number = true
  local_vim.opt.spell = false
  local_vim.opt.signcolumn = "auto"
  local_vim.opt.wrap = false
  -- local_vim.opt.textwidth = 30
  local_vim.g.minimap_auto_start = 1

  local_vim.g.mapleader = " "
  local_vim.g.autoformat_enabled = true
  local_vim.g.cmp_enabled = true
  local_vim.g.autopairs_enabled = true
  local_vim.g.diagnostics_mode = 3
  local_vim.g.icons_enabled = true
  local_vim.g.ui_notifications_enabled = false
  -- set no swap file
  local_vim.opt.swapfile = false

  local_vim.g.instant_username = "SK-client"
  -- local_vim.g.UltiSnipsEnableSnipMate = 1
  -- local_vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips' }
  -- vim.g.UltiSnipsEnableSnipMate = 1
  -- vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips' }
  -- set cursor column
  local_vim.opt.cursorcolumn = true

  -- set zoom to 100%
  local_vim.g.zoom_level = 120
  -- set cmp preselect mode
  -- local_vim.g.cmp_preselect = "always"
  --

  -- config dartls.server-setting.dart.lineLength = 120
  -- local dartls = require('lspconfig').
  --print("eiei sk dartls=" .. dartls)
  -- dartls.setup {
  --   settings = {
  --     dart = {
  --       lineLength = 120
  --     }
  --   }
  -- }
  --
  -- vim.g.textwidth = 30

  -- vim.g.github_enterprise_urls = { 'https://github.com/PENGKIE/consumer' }
  -- local_vim.g.github_enterprise_urls = { 'https://github.com/PENGKIE/consumer' }
  local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list

  return local_vim
end
