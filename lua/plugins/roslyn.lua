return {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {},
    config = function(_, opts)
        require("roslyn").setup(opts)
        vim.lsp.config("roslyn", {
            cmd = { "roslyn-language-server", "--stdio" },
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                    csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                    csharp_enable_inlay_hints_for_types = true,
                },
                ["csharp|completion"] = {
                    dotnet_show_completion_items_from_unimported_namespaces = true,
                },
            },
            handlers = {
                ["workspace/projectInitializationComplete"] = function(_, _, ctx)
                    if not require("roslyn.config").get().silent then
                        vim.notify("Roslyn project initialization complete", vim.log.levels.INFO, { title = "roslyn.nvim" })
                    end
                    vim.api.nvim_exec_autocmds("User", {
                        pattern = "RoslynInitialized",
                        modeline = false,
                        data = { client_id = ctx.client_id },
                    })
                end,
            },
        })
        vim.lsp.enable("roslyn")
    end,
}

