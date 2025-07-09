-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  'fedepujol/move.nvim',
  opts = {}, -- enables defaults
  keys = {
    -- Normal mode
    { '<A-j>', ':MoveLine(1)<CR>', desc = 'Move line down' },
    { '<A-k>', ':MoveLine(-1)<CR>', desc = 'Move line up' },
    { '<A-h>', ':MoveHChar(-1)<CR>', desc = 'Move char left' },
    { '<A-l>', ':MoveHChar(1)<CR>', desc = 'Move char right' },
    { '<leader>wf', ':MoveWord(1)<CR>', desc = 'Move word forward' },
    { '<leader>wb', ':MoveWord(-1)<CR>', desc = 'Move word backward' },

    -- Visual mode
    { '<A-j>', ':MoveBlock(1)<CR>', mode = 'v', desc = 'Move block down' },
    { '<A-k>', ':MoveBlock(-1)<CR>', mode = 'v', desc = 'Move block up' },
    { '<A-h>', ':MoveHBlock(-1)<CR>', mode = 'v', desc = 'Move block left' },
    { '<A-l>', ':MoveHBlock(1)<CR>', mode = 'v', desc = 'Move block right' },
  },
}
