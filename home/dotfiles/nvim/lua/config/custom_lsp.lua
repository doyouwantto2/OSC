-- ~/.config/nvim/lua/config/custom_lsp.lua
local lspconfig = require("lspconfig")

-- HTMLHint
lspconfig.htmlhint_ls = {
  default_config = {
    cmd = { "htmlhint-ls", "--stdio" },
    filetypes = { "html" },
    root_dir = lspconfig.util.root_pattern(".git", "package.json"),
    settings = {},
  },
}

-- CSSLint
lspconfig.csslint_ls = {
  default_config = {
    cmd = { "csslint", "--stdio" },
    filetypes = { "css" },
    root_dir = lspconfig.util.root_pattern(".git", "package.json"),
    settings = {},
  },
}

