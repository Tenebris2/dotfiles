vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_transparency = 0.2

-- disable lsp if discharging (not charging laptop)
vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fr",
  ':lua require("telescope.builtin").lsp_references()<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
vim.api.nvim_set_keymap("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
vim.api.nvim_set_keymap("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
vim.api.nvim_set_keymap("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

vim.api.nvim_set_keymap("n", "<leader>so", ":Outline<CR>", { desc = "Toggle Outline" })
vim.api.nvim_set_keymap("n", "<Leader>fe", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fl", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Q", "<C-w>o<CR>:q!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pm", ":SymbolsOutline<CR>:NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>md", ":MarkdownPreview<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  vim.api.nvim_set_keymap("n", "<A-=>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":GoRun<CR>", { noremap = true, silent = true })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sh",
  callback = function()
    vim.lsp.start {
      name = "bash-language-server",
      cmd = { "bash-language-server", "start" },
    }
  end,
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd [[colorscheme nord]]
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd [[colorscheme kanagawa-dragon]]
require("lualine").setup {
  options = {
    theme = "nord",
    -- ... the rest of your lualine config
  },
}

require("everforest").setup {
  ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
  ---Default is "medium".
  background = "hard",
  ---How much of the background should be transparent. 2 will have more UI
  ---components be transparent (e.g. status line background)
  transparent_background_level = 0.2,
  ---Whether italics should be used for keywords and more.
}
