-- LuaLine
require('lualine').setup {
  options = {
    theme = 'ayu_dark',
    icons_enabled = false,
  },
  sections = {
    lualine_a = {
      'mode',
      -- 'g:coc_status'
    },
    lualine_b = {
      'branch'
    },
    lualine_x = {'filetype'}
  }
}

local action_state = require('telescope.actions.state')
require('telescope').setup{
  defaults = {
      mappings = {
          i = {
              ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry()))end
          }
      }
  }
}
require('telescope').load_extension('fzf')
require('nvim-treesitter.configs').setup { highlight = { enable = true } }

local tele_mapping ={}

tele_mapping.curr_buff = function ()
  require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending"})
end

return tele_mapping
