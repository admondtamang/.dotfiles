return {
        -- Lsp installer and loader
        {
            "williamboman/mason.nvim",
            event = "BufReadPre",
            config = true,
        },
}