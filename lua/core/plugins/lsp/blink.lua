return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",

    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        cmdline = {},
        providers = {
          path = {
            opts = {
              show_hidden_files_by_default = true,
            },
          },
        },
      },

      signature = {
        enabled = true,
      },
    },
  },
}
