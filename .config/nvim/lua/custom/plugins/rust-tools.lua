return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Standard keybindings (optional)
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

                        -- Run Clippy on save
                        vim.api.nvim_create_autocmd("BufWritePost", {
                            pattern = "*.rs",
                            callback = function()
                                vim.cmd("silent !cargo clippy")
                            end,
                        })
                    end,
                },
            })
        end,
    },
}
