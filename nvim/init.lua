-----------------
-----OPTIONS-----
-----------------

vim.o.number         = true 
vim.o.relativenumber = true
vim.o.expandtab      = true 
vim.o.smartindent    = true
vim.o.wrap           = true
vim.o.cursorline     = true 
vim.o.termguicolors  = true 
vim.o.tabstop        = 4 
vim.o.shiftwidth     = 4 

vim.g.mapleader      = " "

------------------
-----BINDINGS-----
------------------

function exec_cmd(cmd)
    return "<cmd>" .. cmd .. "<CR>"
end

local Leader       = "<leader>"
local Esc          = "<Esc>"
local base_options =  { noremap = true, silent = true }

vim.api.nvim_set_keymap(
    "n", Leader .. "e", exec_cmd("Rex"), 
    base_options
)

vim.api.nvim_set_keymap(
    "n", Leader .. "w", exec_cmd("w"),
    base_options
)

vim.api.nvim_set_keymap(
    "n", Leader .. "q", exec_cmd("q"),
    base_options 
)

vim.api.nvim_set_keymap(
    "n", Esc, exec_cmd("noh"),
    base_options
)
