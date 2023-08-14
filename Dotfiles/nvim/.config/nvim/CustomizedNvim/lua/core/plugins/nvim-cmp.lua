local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


-- More nerdfont icons on https://www.nerdfonts.com/cheat-sheet
-- local kind_icons = {
--   Text = "󰊄",
--   Method = "m",
--   Function = "󰊕",
--   Constructor = "",
--   Field = "",
--   Variable = "󰫧",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "v",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "c",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "t"
-- }



cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end
  },
  mapping = {
    ["<C-i>"] = cmp.mapping.select_prev_item(),
    ["<C-k>"] = cmp.mapping.select_next_item(),
    -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    -- ["<C-l>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-h>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      --     cmp.select_next_item()
      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" })
  },
  formatting = {
    -- fields = { "kind", "abbr", "menu" },
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Return icons only
      vim_item.kind = vim_item.kind -- Return name of the item kind only
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- Return icons and name
      vim_item.menu = ({
        -- copilot = '[Copilot]',
        nvim_lsp = "[LSP]",
        luasnip = "[SNP]",
        buffer = "[BUF]",
        path = "[PATH]"
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
    { name = "copilot" },
    { name = "luasnip", keyword_length = 3 },
    {
      name = "nvim_lsp",
      keyword_length = 3,
      entry_filter = function(entry, context)
        local kind = entry:get_kind()
        local line = context.cursor_line
        local col = context.cursor.col
        local char_before_cursor = string.sub(line, col - 1, col - 1)
        if char_before_cursor == "." then
          if kind == 2 or kind == 5 then
            return true
          else
            return false
          end
        elseif string.match(line, "^%s*%w*$") then
          if kind == 3 or kind == 6 then
            return true
          else
            return false
          end
        end
        return true
      end
      -- entry_filter = function(entry) -- Don't show completion items with a kind of 15 (snippet) fron lsp sources
      --   if entry:get_kind() == 15 then
      --     return false
      --   end
      -- end
    },
    { name = "buffer", keyword_length = 3 },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    },
    completion = {
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:SpecialKey,CursorLine:PmenuSel,Search:None", -- :highlight command to see colors
      side_padding = 0,
      col_offset = -2,

    }
  },
  experimental = {
    ghost_text = false,
    native_menu = false
  }
})
