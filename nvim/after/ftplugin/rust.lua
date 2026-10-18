vim.g.rustaceanvim = {
  server = {
    cmd = function()
      return { "rustup", "run", "stable", "rust-analyzer" }
    end,
    default_settings = {
      ['rust-analyzer'] = {
        procMacro = {
          enable = true,
          attributes = {
            enable = true,
          },
        },
        cargo = {
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        check = {
          command = "clippy",
          extraArgs = { "--no-deps" }
        },
        -- diagnostics = {
        --   disabled = { "unresolved-proc-macro", "macro-error" }
        -- },
      },
    },
  },
}
