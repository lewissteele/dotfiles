local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt.tabstop = 2

require("lazy").setup({
  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      config = true,
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      },
      config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup()
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
      end,
    },
    {
      "okuuva/auto-save.nvim",
      version = '^1.0.0',
      config = true,
    },
    {
      "williamboman/mason.nvim",
      config = true,
    },
    {
      "saghen/blink.cmp",
      version = "1.*",
      config = true,
      opts = {
        signature = { enabled = true },
      },
    },
    {
      "christoomey/vim-tmux-navigator",
    },
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
    },
  },
})

require('nvim-treesitter').install { "go", "php" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "php" },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.mod", "go.work", ".git" },
  settings = {
    gopls = { gofumpt = true },
  },
})

vim.lsp.config("intelephense", {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".git" },
})

vim.lsp.enable({
  "gopls",
  "intelephense",
})

vim.diagnostic.config({ virtual_text = true })
