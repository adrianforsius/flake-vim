{...}: {
  config = {
    # TODO: activate when ready
    # vimAlias = true;
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
    plugins.treesitter-context = {
      enable = true;
      settings = {
        enable = true;
        line_numbers = true;
        max_lines = 0;
        min_window_height = 0;
        mode = "topline";
        multiline_threshold = 20;
        separator = "-";
        trim_scope = "inner";
        zindex = 20;
      };
    };

    plugins.cmp_luasnip.enable = true;
    plugins.luasnip.enable = true;
    plugins.comment.enable = true;
    # # TODO: telescope buffer solution messing with previous location (ctrl+o)
    # plugins.telescope = {
    #   enable = true;
    #   keymaps = {
    #     "<C-p>" = {
    #       action = "git_files";
    #       options = {
    #         desc = "Telescope Git Files";
    #         noremap = true;
    #       };
    #     };
    #     "<leader>fg" = "live_grep";
    #   };
    #   extensions.file-browser.enable = true;
    # };
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
        # "<C-l>" = "live_grep";
        # "<C-g>" = "grep";
        "<leader>fg" = "live_grep";
      };
    };

    plugins.none-ls = {
      enable = true;
      sources = {
        formatting = {
          goimports.enable = true;
        };
      };
    };
    plugins.lsp = {
      enable = true;

      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          "<leader>a" = "code_action";
        };
        diagnostic = {
          "<leader>a" = "goto_next";
          "<leader>j" = "goto_next";
          "<leader>b" = "open_float";
        };
      };

      # TODO: possibly use mason instead
      servers = {
        tsserver.enable = true;
        nil_ls = {
          enable = true;
          autostart = true;
        };

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

    plugins.cmp-vsnip.enable = true;
    plugins.cmp-treesitter.enable = true;
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        preselect = "cmp.PreselectMode.Item";
        sources = [
          {
            name = "nvim_lsp";
          }
          # {
          #   name = "vsnip";
          # }
          # {
          #   name = "ultisnips";
          # }
          # {
          #   name = "snippy";
          # }
          {
            name = "luasnip";
          }
          {
            name = "path";
          }
          {
            name = "buffer";
          }
        ];
        completion = {
          autocomplete = ["require('cmp.types').cmp.TriggerEvent.TextChanged"];
          completeopt = "menu,menuone,noselect";
          keyword_length = 1;
        };
        matching = {
          disallow_fullfuzzy_matching = false;
          disallow_fuzzy_matching = false;
          disallow_partial_fuzzy_matching = true;
          disallow_partial_matching = false;
          disallow_prefix_unmatching = false;
        };
        performance = {
          async_budget = 1;
          confirm_resolve_timeout = 80;
          debounce = 60;
          fetching_timeout = 500;
          max_view_entries = 200;
          throttle = 30;
        };
        confirmation.get_commit_characters = ''function(commit_characters) return commit_characters end'';
        formatting = {
          expandable_indicator = true;
          fields = ["abbr" "kind" "menu"];
          format = ''
            function(_, vim_item) return vim_item end
          '';
        };
        snippet = {
          # vim.fn["vsnip#anonymous"](args.body)
          # require('snippy').expand_snippet(args.body)
          # vim.fn["UltiSnips#Anon"](args.body)
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
        sorting = {
          comparators = [
            "require('cmp.config.compare').offset"
            "require('cmp.config.compare').exact"
            "require('cmp.config.compare').score"
            "require('cmp.config.compare').recently_used"
            "require('cmp.config.compare').locality"
            "require('cmp.config.compare').kind"
            "require('cmp.config.compare').length"
            "require('cmp.config.compare').order"
          ];
          priority_weight = 2;
        };
        view = {
          entries = {
            name = "custom";
            selection_order = "top_down";
          };
          docs.auto_open = true;
        };
        window.completion = {
          border = ["" "" "" "" "" "" "" ""];
          col_offset = 0;
          scrollbar = true;
          scrolloff = 0;
          side_padding = 1;
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None";
        };
        window.documentation = {
          border = ["" "" "" "" "" "" "" ""];
          max_height = "math.floor(40 * (40 / vim.o.lines))";
          max_width = "math.floor((40 * 2) * (vim.o.columns / (40 * 2 * 16 / 9)))";
          winhighlight = "FloatBorder:NormalFloat";
        };
      };
    };

    opts = {
      showbreak = "↪";
      list = true;
      listchars = "tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨";
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
