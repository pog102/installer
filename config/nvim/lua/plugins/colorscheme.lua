return {
  {
    "catppuccin/nvim", name = "catppuccin",

    config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      -- transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      styles = {
        comments = {
          "italic"
        },
        conditionals = {
          "italic"
        },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
      },
    })
    vim.cmd.colorscheme "catppuccin"
    end
  }
}
