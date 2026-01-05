return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          theme = {
              all = {
                  ui = {
                      bg_gutter = "none"
                  }
              }
          }
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
              NormalFloat = { bg = "none" },
              FloatBorder = { bg = "none" },
              FloatTitle = { bg = "none" },
              DiagnosticFloatingError = { fg = "#E46876", bg = "NONE" },
              DiagnosticFloatingWarn = { fg = "#E6C384", bg = "NONE" },
              DiagnosticFloatingInfo = { fg = "#7FB4CA", bg = "NONE" },
              DiagnosticFloatingHint = { fg = "#7AA89F", bg = "NONE" },
              DiagnosticUnderlineError = { sp = "#E46876", undercurl = true },
              DiagnosticUnderlineWarn = { sp = "#E6C384", undercurl = true },
              DiagnosticUnderlineInfo = { sp = "#7FB4CA", undercurl = true },
              DiagnosticUnderlineHint = { sp = "#7AA89F", undercurl = true },
              NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
              LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
              MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
              Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
              PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
              PmenuSbar = { bg = theme.ui.bg_m1 },
              PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        theme = "dragon",
        background = {
            dark = "dragon",
            light = "wave"
        },
      })

      vim.cmd("colorscheme kanagawa")
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#ebdbb2', bg = '#181616' })
    end,
  },
}
