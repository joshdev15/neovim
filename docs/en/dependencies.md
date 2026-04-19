# Dependencies & Plugins

This configuration uses the **Native Package Manager** (`site/pack/native/start/`) for loading plugins instead of a third-party manager like Lazy.nvim.

Here is a list of the main plugins and dependencies used in this project:

| Category | Plugin | Description |
| :--- | :--- | :--- |
| **Plugin Manager** | **Native** | Neovim's built-in package management system (`packpath`). |
| **UI & Appearance** | [Catppuccin](https://github.com/catppuccin/nvim) | Soothing pastel theme for Neovim. |
| | [Gruvbox-Material](https://github.com/sainnhe/gruvbox-material) | A modified version of Gruvbox with softer contrasts. |
| | [Lualine](https://github.com/nvim-lualine/lualine.nvim) | A blazing fast and easy to configure Neovim statusline written in Lua. |
| | [Tabby](https://github.com/nanozuki/tabby.nvim) | A declarative, configurable, and customizable tabline plugin. |
| **Navigation & Files** | [Nvim-Tree](https://github.com/nvim-tree/nvim-tree.lua) | A file explorer tree for Neovim written in Lua. |
| | [Telescope](https://github.com/nvim-telescope/telescope.nvim) | A highly extendable fuzzy finder over lists. |
| | [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Provides icons for various plugins (requires a Nerd Font). |
| **Git Integration** | [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Super fast git decorations implemented purely in Lua. |
| **Editor Tools** | [Vim-Surround](https://github.com/tpope/vim-surround) | Quoting/parenthesizing made simple. |
| | [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart and powerful comment plugin for Neovim. |
| **LSP & Autocomplete** | [Mason](https://github.com/williamboman/mason.nvim) | Portable package manager for LSPs, DAP, linters, and formatters. |
| | [Mason-LspConfig](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges Mason and lspconfig. |
| | [Nvim-LspConfig](https://github.com/neovim/nvim-lspconfig) | Quickstart configs for Neovim LSP. |
| | [Nvim-Cmp](https://github.com/hrsh7th/nvim-cmp) | A completion plugin for Neovim coded in Lua. |
| | [Nvim-Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Better syntax highlighting and code understanding. |
| **Language Specific** | [Go.nvim](https://github.com/ray-x/go.nvim) | A modern go neovim plugin based on treesitter, nvim-lsp, and dap. |
| | [Vim-Prettier](https://github.com/prettier/vim-prettier) | A Vim plugin wrapper for Prettier. |