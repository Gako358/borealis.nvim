{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    ,
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
      # Building theme
      borealis = pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "borealis";
        version = "1.0.0";
        src = ./.;
      };

      # Building Neovim with theme and needed plugins
      neovim-test = pkgs.neovim.override {
        configure = {
          packages.packages = with pkgs.vimPlugins; {
            start = [
              borealis
              (nvim-treesitter.withPlugins (
                plugins:
                  with plugins; [
                    tree-sitter-nix
                    tree-sitter-rust
                    tree-sitter-lua
                    tree-sitter-python
                    tree-sitter-c
                  ]
              ))
              nvim-web-devicons
              bufferline-nvim
              indent-blankline-nvim
              lightspeed-nvim
              nvim-tree-lua
              lualine-nvim
            ];
          };
          customRC = ''
            syntax on
            set termguicolors
            colorscheme borealis

            lua << EOF
            require("bufferline").setup{}
            vim.opt.list = true

            vim.opt.listchars:append "space:⋅"
            vim.opt.listchars:append "eol:↴"
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
            require("nvim-tree").setup()

            local borealis_theme = require("lualine.themes.borealis")
            require("lualine").setup {
              options = {
                theme = borealis_theme,
              },
            }
            EOF
          '';
        };
      };
    in
    {
      packages.neovim-test = neovim-test;
      packages.default = self.packages.${system}.neovim-test;

      apps.neovim-test = {
        type = "app";
        program = "${self.packages.${system}.neovim-test}/bin/nvim-test";
      };

      # Run `nix build` to build and test theme
      apps.default = self.apps.${system}.neovim-test;

      devShell = pkgs.mkShell {
        packages = with pkgs; [
          luajit
        ];
      };
    });
}
