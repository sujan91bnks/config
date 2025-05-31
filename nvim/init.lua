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

vim.opt.mouse = "a"
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.encoding = "utf8"
vim.opt.history = 5000
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "dd", "_dd", { noremap = true })
vim.keymap.set("n", "<C-e>", ":Oil<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-g>", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- vim.g.vscode_style = "dark"
-- vim.cmd("colorscheme vscode")

require("lazy").setup({
    { "neoclide/coc.nvim", branch = "release" },
    { "jiangmiao/auto-pairs" },
    { "Mofiqul/vscode.nvim" },
    { "stevearc/oil.nvim", config = function()
        require("oil").setup({
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
        })
    end },
    { "pocco81/auto-save.nvim" },
    { "Chiel92/vim-autoformat" },
    { "folke/trouble.nvim" },
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", config = function()
        require("telescope").setup({})
    end },
    { "williamboman/mason.nvim", config = function()
        require("mason").setup()
    end },
    { "williamboman/mason-lspconfig.nvim", config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "html" }
        })
    end },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "MunifTanjim/nui.nvim" },
    { "kawre/leetcode.nvim", 
        opts = {
            lang = "python"
        }
    },
    { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = { "markdown" } },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",
            highlight = {
                enable = true,
            },
        })
    end },
    { "hrsh7th/nvim-cmp" },
})
