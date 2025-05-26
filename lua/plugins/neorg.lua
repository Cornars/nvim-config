return {
    "nvim-neorg/neorg",
    dependencies = {
    },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {
                config = { -- We added a `config` table!
                    icon_preset = "varied", -- And we set our option here.
                },
            },
            ["core.tempus"] = {},
        }
    },
}
