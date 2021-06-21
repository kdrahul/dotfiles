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
require('telescope').load_extension('coc')
require('nvim-treesitter.configs').setup { highlight = { enable = true } }
-- Compe nvim held off for now
-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 1;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   incomplete_delay = 400;
--   allow_prefix_unmatch = false;

--   source = {
--     path = true;
--     buffer = true;
--     vsnip = true;
--     nvim_lsp = true;
--     nvim_lua = true;
--     spell = true;
--     snippets_nvim = true;
--     your_awesome_source = {};
--   };
-- }

local tele_mapping ={}

tele_mapping.curr_buff = function ()
  require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending"})
end

return tele_mapping
