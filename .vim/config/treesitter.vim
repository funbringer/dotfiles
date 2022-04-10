lua << EOF
  require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
      "nix",
      "rust",
      "vala",
    },

    highlight = {
      enable = true,
    }
  }
EOF
