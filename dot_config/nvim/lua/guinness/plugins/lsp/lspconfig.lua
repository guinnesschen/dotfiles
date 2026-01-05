return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- LSP keybindings
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap.set

        keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP references" }))
        keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP definitions" }))
        keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP implementations" }))
        keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" }))
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "See available code actions" }))
        keymap("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Smart rename" }))
        keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" }))
        keymap("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))
        keymap("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" }))
        keymap("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" }))
        keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show documentation for what is under cursor" }))
        keymap("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })

    -- Diagnostic icons
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type, numhl = "" })
    end

    -- Capabilities for autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Configure LSP servers using the new vim.lsp.config API
    mason_lspconfig.setup_handlers({
      function(server_name)
        vim.lsp.config(server_name, {
          capabilities = capabilities,
        })
        vim.lsp.enable(server_name)
      end,
      ["lua_ls"] = function()
        vim.lsp.config("lua_ls", {
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        })
        vim.lsp.enable("lua_ls")
      end,
    })
  end,
}
