local status_ok, catppuccin = pcall(require, 'catppuccin')
if not status_ok then
  return
end

catppuccin.setup({
  flavour = "mocha",   -- latte, frappe, macchiato, mocha
  background = {
                       -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = false,   -- show the '~' characters after the end of buffers
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = true,   -- Force no italic
  no_bold = false,    -- Force no bold
  styles = {
    comments = {},
    conditionals = {},
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
  color_overrides = {
    mocha = {
      base      = "#161925",       --Default bg
      overlay2  = "#9399B2",       --Brackets, parenthesis, etc.
      overlay0  = "#6C7086",       --Comments
      mantle    = "#181825",       --Bottom bar bg
      text      = "#00c1e4",       --Variable
      green     = "#f9dc5c",       --Strings
      yellow    = "#71f79f",       --Components
      surface1  = "#45475A",       --sidebar number and empty space
      surface0  = "#272736",       --Current cursor line bg alt:#313244
      flamingo  = "#f58a42",       --Const, new, etc.
      pink      = "#816bd1",       --Import, export, throw, etc.
      mauve     = "#c74ded",       --Async, function, await, etc.
      peach     = "#bcd119",       --Number
      sapphire  = "#194ad1",       --Constructor
      blue      = "#03fc4e",       --Functions and methods
      lavender  = "#00c1e4",       --Current cursor line nbr
      red       = "#fc0303",       --Errors
      teal      = "#fc3d03",       --Hint

      --Not yet customized
      crust     = "#11111B",       --Darkest bg
      surface2  = "#585B70",       --Default comment
      rosewater = "#F5E0DC",       --Winbar
      maroon    = "#EBA0AC",       --Light

      sky       = "#89DCEB",       --Operator
      subtext1  = "#BAC2DE",       --Indicator
      subtext0  = "#A6ADC8",       --Float title
      overlay1  = "#7F849C",       --Conceal color
      --yellow    = "#F9E2AF", --Warning
    },
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

