local sources = {
  -- settings
  "settings.colorschemes",
  "settings.keymaps",
  "settings.options",
  "settings.plugins",
  "settings.impatient",
  
  -- -- plugins
  "configs.alpha",
  "configs.autopairs",
  "configs.autosave",
  "configs.better_escape",
  "configs.bufferline",
  "configs.cmp",
  "configs.colorizer",
  "configs.comments",
  "configs.filetype",
  "configs.gitsigns",
  "configs.indentline",
  "configs.lualine",
  "configs.neoscroll",
  "configs.nvim-tree",
  "configs.presence",
  "configs.symbols_outline",
  "configs.telescope",
  "configs.toggleterm",
  "configs.treesitter",
  "configs.trouble",
  "configs.webdevicons",
  "configs.which-key",
  "lsp",
  }

  for _, source in ipairs(sources) do
    local status_ok, notok = pcall(require, source)
    if not status_ok then
      error("Couldn't load " .. source .. "\n" .. notok)
    end
  end

