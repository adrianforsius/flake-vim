{...}: {
  config = {
    colorschemes.gruvbox.enable = true;

    plugins.lualine = {
      globalstatus = true;
      enable = true;
      sections.lualine_c = [
        {
          extraConfig = {
            path = 3;
          };
          name = "filename";
        }
      ];
    };
    plugins.treesitter.enable = true;

    plugins.cmp_luasnip.enable = true;
    plugins.luasnip.enable = true;
    plugins.comment-nvim.enable = true;
    plugins.fzf-lua = {
      enable = true;
      iconsEnabled = true;
      keymaps = {
        "<C-p>" = {
          action = "git_files";
          options = {
            desc = "Fzf-Lua Git Files";
            silent = true;
          };
          settings = {
            winopts = {
              height = 0.5;
            };
          };
        };
        "<C-l>" = "live_grep";
        "<C-g>" = "grep";
      };
    };

    plugins.lsp = {
      enable = true;

      servers = {
        tsserver.enable = true;

        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        rust-analyzer = {
          installRustc = true;
          enable = true;
          installCargo = true;
        };

        gopls = {
          enable = true;
          autostart = true;
        };
      };
    };

    plugins.nvim-cmp = {
      enable = true;
      autoEnableSources = true;

      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "luasnip";}
      ];
      snippet.expand = "luasnip";

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = {
          action = "cmp.mapping.select_prev_item()";
          modes = [
            "i"
            "s"
          ];
        };
        "<Tab>" = {
          action = "cmp.mapping.select_next_item()";
          modes = [
            "i"
            "s"
          ];
        };
      };
    };

    options = {
      # Enable relative line numbers
      number = true;
      relativenumber = true;

      # Make vim more useful
      clipboard = "unnamedplus";

      # Set tabs to 2 spaces
      tabstop = 2;
      softtabstop = 2;
      # showtabline = 2;
      expandtab = true;

      # Enable auto indenting and set it to spaces
      smartindent = true;
      shiftwidth = 2;

      # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
      breakindent = true;

      # Enable incremental searching
      hlsearch = true;
      incsearch = true;

      # Enable text wrap
      wrap = true;

      # Better splitting
      # splitbelow = true;

      # splitright = true;

      # Enable mouse mode
      mouse = "a"; # Mouse

      # Enable ignorecase + smartcase for better searching
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";

      # Decrease updatetime
      updatetime = 50; # faster completion (4000ms default)

      # Set completeopt to have a better completion experience
      completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

      # Enable persistent undo history
      swapfile = false;
      backup = false;
      undofile = true;

      # Enable 24-bit colors
      termguicolors = true;

      # Enable the sign column to prevent the screen from jumping
      # signcolumn = "yes";

      # Enable cursor line highlight
      cursorline = true; # Highlight the line where the cursor is located

      # Set fold settings
      # These options were reccommended by nvim-ufo
      # See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;

      # Always keep 8 lines above/below cursor unless at start/end of file
      scrolloff = 8;

      # Place a column line
      # colorcolumn = "80";

      # Set to 1000 because of comment-nvim bug: https://github.com/numToStr/Comment.nvim/issues/115#issuecomment-1032290098
      timeoutlen = 1000;

      # Set encoding type
      encoding = "utf-8";
      fileencoding = "utf-8";

      # Change cursor options
      guicursor = [
        "n-v-c:block" # Normal, visual, command-line: block cursor
        "i-ci-ve:block" # Insert, command-line insert, visual-exclude: vertical bar cursor with block cursor, use "ver25" for 25% width
        "r-cr:hor20" # Replace, command-line replace: horizontal bar cursor with 20% height
        "o:hor50" # Operator-pending: horizontal bar cursor with 50% height
        "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" # All modes: blinking settings
        "sm:block-blinkwait175-blinkoff150-blinkon175" # Showmatch: block cursor with specific blinking settings
      ];

      # More space in the neovim command line for displaying messages
      # cmdheight = 0;

      # We don't need to see things like INSERT anymore
      showmode = false;
    };
  };
}
