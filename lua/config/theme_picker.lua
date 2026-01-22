local themes = require("config.themes")

local function pick_theme()
  local names = vim.tbl_keys(themes.themes)

  require("telescope.pickers").new({}, {
    prompt_title = "Select Theme",
    finder = require("telescope.finders").new_table {
      results = names,
    },
    sorter = require("telescope.config").values.generic_sorter({}),
    attach_mappings = function(_, map)

      map("i", "<CR>", function(bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(bufnr)

        themes.apply(selection.value, true)
        require("config.ui_overrides").apply()
        require("config.statusline")
      end)

      map("i", "<Tab>", function()
        local entry = require("telescope.actions.state").get_selected_entry()
        if entry then
          themes.apply(entry.value, false)
          require("config.ui_overrides").apply()
        end
      end)

      return true
    end,
  }):find()
end

return pick_theme
