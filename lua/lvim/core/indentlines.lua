local M = {}

M.config = function()
  lvim.builtin.indentlines = {
    active = true,
    on_config_done = nil,
    options = {
      -- enabled = true,
      exclude = {
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "text",
        },
        buftypes = {
          "terminal",
          "nofile",
        },
      },
      indent = {
        char = lvim.icons.ui.LineLeft,
      },
      scope = { show_start = false, show_end = false },
      -- context_char = lvim.icons.ui.LineLeft,
      -- show_trailing_blankline_indent = false,
      -- show_first_indent_level = true,
      -- use_treesitter = true,
      -- show_current_context = true,
    },
  }
end

M.setup = function()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  indent_blankline.setup(lvim.builtin.indentlines.options)

  if lvim.builtin.indentlines.on_config_done then
    lvim.builtin.indentlines.on_config_done()
  end
end

return M
