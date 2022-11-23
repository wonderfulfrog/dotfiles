local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "%.png",
            "^index.%",
        },
        prompt_prefix = "» ",
        selection_caret = " ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        path_display = { "smart" },
        dynamic_preview_title = true,
        layout_config = {
            prompt_position = "top",
            height = 0.8,
        },
    },
})
