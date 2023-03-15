local g = vim.g

-- Map leader
g.mapleader = [[ ]]

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end

require('settings')
require('plugins')
require('keybindings')
