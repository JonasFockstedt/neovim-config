local dbt = require("dbtpal")
dbt.setup({
    -- Path to the dbt executable
    path_to_dbt = "dbt",

    -- Path to the dbt project, if blank, will auto-detect
    -- using currently open buffer for all sql,yml, and md files
    path_to_dbt_project = "",

    -- Path to dbt profiles directory
    path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),

    -- Search for ref/source files in macros and models folders
    extended_path_search = true,

    -- Prevent modifying sql files in target/(compiled|run) folders
    protect_compiled_files = true,
})

-- Setup key mappings
vim.keymap.set("n", "<leader>drf", dbt.run)
vim.keymap.set("n", "<leader>dra", dbt.run_all)
vim.keymap.set("n", "<leader>dtf", dbt.test)
vim.keymap.set("n", "<leader>drp", dbt.run_parents)
vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)
-- also "go-to-file" by hitting "gf"

-- Enable Telescope Extension
require("telescope").load_extension("dbtpal")
