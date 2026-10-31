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
vim.opt.updatetime = 300

require("lazy").setup({
  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "auto",
        background = { light = "latte", dark = "mocha" },
      },
      config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
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
      keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
      },
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<CR>" },
      },
      opts = {
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        renderer = {
          highlight_opened_files = "name",
        },
        filters = {
          custom = { "^\\.DS_Store$" },
          git_ignored = false,
        },
      },
    },
    {
      "okuuva/auto-save.nvim",
      version = "1.*",
      config = true,
    },
    {
      "saghen/blink.cmp",
      version = "1.*",
      opts = {
        signature = { enabled = true },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      lazy = false,
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter").install({ "javascript", "typescript", "jsdoc", "tsx", "php" })
      end,
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {
        check_ts = true,
      },
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "php" },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.lsp.config("tsc", {
  cmd = { "tsc", "--lsp", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})

vim.lsp.config("intelephense", {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".git" },
})

vim.lsp.enable({ "tsc", "intelephense" })

vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("diagnostic_float", { clear = true }),
  callback = function()
    vim.diagnostic.open_float({ scope = "cursor", focus = false })
  end,
})
