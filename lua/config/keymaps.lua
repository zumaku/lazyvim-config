-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- wrap kode dengan alt+z
vim.keymap.set("n", "<A-z>", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle word wrap" })

-- Aktifkan wrap
vim.opt.wrap = true

-- Jangan potong kata di tengah
vim.opt.linebreak = true

-- Indent baris lanjutan agar rapi
vim.opt.breakindent = true

-- (Opsional) Tambahan indent untuk baris wrap
vim.opt.breakindentopt = "shift:2"

-- (Opsional) Jangan wrap di tengah kata panjang
vim.opt.wrapscan = true

-- (Opsional) Lebih smooth saat navigasi
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 5

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://www.lazyvim.org/keymaps
-- Delete word like VSCode

-- Ctrl + Backspace → hapus kata ke belakang
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-w>", { desc = "Delete word backward" })
vim.keymap.set({ "i", "c" }, "<C-h>", "<C-w>", { desc = "Delete word backward" })

-- Ctrl + Delete → hapus kata ke depan
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete word forward" })

-- Move line up/down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

-- comment block
vim.keymap.set("v", "<C-S-/>", "gb", { desc = "Block comment" })

vim.keymap.set("n", "<leader>ci", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.title:lower():find("import")
    end,
    apply = true,
  })
end, { desc = "Quick import" })

-- =========================================================
-- TERMINAL CONFIG (LazyVim + Snacks Terminal)
-- =========================================================

-- Vertical terminal (kanan)
vim.keymap.set({ "n", "t" }, "<A-v>", function()
  Snacks.terminal(nil, {
    win = {
      position = "right",
      width = 0.4,
    },
  })
end, { desc = "Terminal Vertical" })

-- Horizontal terminal (bawah)
vim.keymap.set({ "n", "t" }, "<A-h>", function()
  Snacks.terminal(nil, {
    win = {
      position = "bottom",
      height = 0.3,
    },
  })
end, { desc = "Terminal Horizontal" })

-- =========================================================
-- TERMINAL NAVIGATION
-- =========================================================

-- Pindah window saat berada di terminal mode
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], {
  desc = "Move Left",
})

vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], {
  desc = "Move Right",
})

vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], {
  desc = "Move Down",
})

vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], {
  desc = "Move Up",
})

-- =========================================================
-- OPTIONAL NORMAL MODE NAVIGATION
-- =========================================================

vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Move Left",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Move Right",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Move Down",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Move Up",
})

-- Reload Buffer
vim.keymap.set("n", "<leader>br", "<cmd>e!<CR>", {
  desc = "Reload Buffer",
})

-- Copy relative path
vim.keymap.set("n", "<leader>yp", function()
  local filepath = vim.fn.expand("%:p")
  local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")

  if vim.v.shell_error == 0 then
    local relative = filepath:sub(#git_root + 2)
    vim.fn.setreg("+", relative)
    vim.notify("Copied: " .. relative)
  else
    vim.fn.setreg("+", vim.fn.expand("%"))
  end
end, { desc = "Copy Git relative path" })

-- Copy absolute path
vim.keymap.set("n", "<leader>yP", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy absolute path" })
