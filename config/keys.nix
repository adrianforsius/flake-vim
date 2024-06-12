{
  globals.mapleader = ",";

  keymaps = [
    # General maps
    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
    }

    {
      mode = "n";
      key = "<leader>s";
      action = "+search";
    }

    {
      mode = "n";
      key = "<leader>q";
      action = "+quit/session";
    }

    {
      mode = ["n" "v"];
      key = "<leader>g";
      action = "+git";
    }

    {
      mode = "n";
      key = "<leader>u";
      action = "+ui";
    }

    {
      mode = "n";
      key = "<leader>w";
      action = "+windows";
    }

    {
      mode = "n";
      key = "<leader><Tab>";
      action = "+tab";
    }

    {
      mode = ["n" "v"];
      key = "<leader>d";
      action = "+debug";
    }

    {
      mode = ["n" "v"];
      key = "<leader>c";
      action = "+code";
    }

    {
      mode = ["n" "v"];
      key = "<leader>t";
      action = "+test";
    }

    # Windows
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Move to window left";
      };
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Move to window right";
      };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Move to window over";
      };
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Move to window bellow";
      };
    }

    # Quit/Session
    # {
    #   mode = "n";
    #   key = "<leader>qq";
    #   action = "<cmd>quitall<cr><esc>";
    #   options = {
    #     silent = true;
    #     desc = "Quit all";
    #   };
    # }

    # {
    #   mode = "n";
    #   key = "<leader>qs";
    #   action = ":lua require('persistence').load()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Restore session";
    #   };
    # }

    # {
    #   mode = "n";
    #   key = "<leader>ql";
    #   action = "<cmd>lua require('persistence').load({ last = true })<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Restore last session";
    #   };
    # }

    # {
    #   mode = "n";
    #   key = "<leader>qd";
    #   action = "<cmd>lua require('persistence').stop()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Don't save current session";
    #   };
    # }

    #   mode = "v";
    #   key = "J";
    #   action = ":m '>+1<CR>gv=gv";
    #   options = {
    #     desc = "Use move command when line is highlighted ";
    #   };
    # }

    # {
    #   mode = "v";
    #   key = "K";
    #   action = ":m '>-2<CR>gv=gv";
    #   options = {
    #     desc = "Use move command when line is highlighted ";
    #   };
    # }

    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        desc = "Allow cursor to stay in the same place after appending to current line ";
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Allow C-d and C-u to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Allow C-d and C-u to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Allow search terms to stay in the middle ";
      };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Allow search terms to stay in the middle ";
      };
    }

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options = {
        desc = "Deletes to void register and paste over";
      };
    }

    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
    # {
    #   mode = [ "n" "v" ];
    #   key = "<leader>y";
    #   action = "\"+y";
    #   options = {
    #     desc = "Copy to system clipboard";
    #   };
    # }

    # {
    #   mode = [ "n" "v" ];
    #   key = "<leader>Y";
    #   action = "\"+Y";
    #   options = {
    #     desc = "Copy to system clipboard";
    #   };
    # }

    # Delete to void register
    {
      mode = ["n" "v"];
      key = "<leader>D";
      action = "\"_d";
      options = {
        desc = "Delete to void register";
      };
    }

    # <C-c> instead of pressing esc just because
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }
    {
      mode = "n";
      key = "<C-p>";
      action = ":Telescope frecency<CR>";
    }

    #{
    #  mode = "n";
    #  key = "Q";
    #  action = "<nop>";
    #}
  ];
}
