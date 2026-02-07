#!/bin/bash

mkdir -p ~/.config/nvim

cat << 'EOF' > ~/.config/nvim/init.lua
-- ===== OPCIONES BÁSICAS =====

vim.opt.number = true           -- números de línea
vim.opt.relativenumber = false  -- números relativos

vim.opt.tabstop = 4             -- tamaño del tab
vim.opt.shiftwidth = 4
vim.opt.expandtab = true        -- tabs → espacios
vim.opt.smartindent = true

vim.opt.wrap = false            -- no partir líneas
vim.opt.cursorline = true      -- resaltar línea actual
vim.opt.termguicolors = true    -- colores true color
vim.opt.scrolloff = 8           -- margen al hacer scroll

-- Portapapeles del sistema
vim.opt.clipboard = "unnamedplus"

-- Leader key
vim.g.mapleader = " "

-- Fondo transparente
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- No mostrar ~ en líneas vacías
vim.opt.fillchars = { eob = " " }

-- Hacer más sutil la columna de números
vim.api.nvim_set_hl(0, "LineNr", { fg = "#5a5f7a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c0caf5", bold = true })

-- Color de la línea actual
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181c26" })


-- ===== KEYMAPS =====

local keymap = vim.keymap.set

-- Guardar
keymap("n", "<leader>w", ":w<CR>")

-- Salir
keymap("n", "<leader>q", ":q<CR>")

-- Guardar y salir
keymap("n", "<leader>x", ":wq<CR>")

-- Quitar resaltado de búsqueda
keymap("n", "<leader>h", ":nohlsearch<CR>")

-- Salir sin guardar
keymap("n", "<leader>Q", ":q!<CR>")


-- ===== MOVERSE ENTRE VENTANAS =====
-- :split - :vsplit
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
EOF
