return {
  {
    "kopecmaciej/vi-sql.nvim",
    config = function()
      require("vi-sql").setup({
        hide_key = "<C-q>",
      })

      -- LazyVim secara default menggunakan <C-h> dan <C-l> untuk pindah window
      -- Kita perlu meneruskan key tersebut ke dalam terminal vi-sql
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*vi-sql*",
        callback = function(args)
          local opts = { buffer = args.buf, nowait = true }
          vim.keymap.set("t", "<C-h>", "<C-h>", opts)
          vim.keymap.set("t", "<C-j>", "<C-j>", opts)
          vim.keymap.set("t", "<C-k>", "<C-k>", opts)
          vim.keymap.set("t", "<C-l>", "<C-l>", opts)
        end,
      })
    end,
    cmd = { "ViSQL", "ViSQLJump" },
    keys = {
      { "<leader>vs", "<cmd>ViSQL<cr>", desc = "Open vi-sql" },
      -- { "<leader>vj", ":ViSQLJump ", desc = "vi-sql: jump to table", silent = false },
    },
  },
}
