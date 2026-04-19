# Installation & Prerequisites

This configuration requires certain programs to be installed on your operating system before you can use it properly.

## 1. Prerequisites

Make sure you have the following installed on your system:

- **[Neovim](https://neovim.io/):** Please use the most recent version of Neovim (v0.12.1+ recommended).
- **[Git](https://git-scm.com/):** Required by the native package manager to download plugins and for general Git integration.
- **[Node.js](https://nodejs.org/):** Preferably a recent version (LTS recommended). Some LSP servers (like `ts_ls` and `html`) and formatters (like Prettier) require Node.js.
- **[Go (Golang)](https://go.dev/) (Optional):** Required only if you are going to use the `go.nvim` plugin and Go LSP (`gopls`).
- **[Yarn](https://yarnpkg.com/) (Optional):** Required only for installing `vim-prettier` dependencies.
- **Nerd Font (Optional but highly recommended):** Required for displaying icons properly in Nvim-Tree and Lualine. You can download one from [Nerd Fonts](https://www.nerdfonts.com/). *(This configuration has been tested specifically with **[JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)**).*

## 2. Directory Structure

Once you download this repository, you need to place it in the correct configuration folder for Neovim:

```bash
# On Linux/MacOS
$HOME/.config/nvim/
```

You can verify your `$HOME` path with:

```bash
echo $HOME
```

Move the contents of this repository (the `lua/` folder and `init.lua` file) into `$HOME/.config/nvim`.

## 3. First Run & Plugin Installation

1. Open a terminal and start Neovim:
   ```bash
   nvim
   ```

2. The **Native Package Manager** script (`lua/plugins.lua`) will automatically bootstrap itself and begin cloning all the necessary repositories into `~/.local/share/nvim/site/pack/native/start/`.

3. Wait for the installation to finish. You should restart Neovim after the initial installation.

## 4. Setting up LSP & Tools (Mason)

This configuration uses Mason to manage LSPs, Linters, and Formatters.

1. Inside Neovim, run:
   ```vim
   :Mason
   ```
2. You can install missing servers directly from the Mason UI. Based on the configuration (`lua/lsp.lua`), the following servers will try to initialize automatically if they are available:
   - `gopls` (Go)
   - `ts_ls` (TypeScript/JavaScript)
   - `html`
   - `cssls`

## 5. Setting up Syntax Highlighting (Treesitter)

Treesitter provides better syntax highlighting.

1. The configuration is set to automatically ensure parsers for: `go`, `lua`, `typescript`, `tsx`, `javascript`, `html`, and `css`.
2. If you need to install a specific language manually, use:
   ```vim
   :TSInstall <language>
   ```
   Example: `:TSInstall python`

> **Note for Apple Silicon (M1/M2/M3) users:** 
> Make sure your terminal is running natively and NOT using Rosetta, otherwise Treesitter compilation might generate errors.

## 6. Prettier Setup

The configuration includes Prettier. Make sure `yarn` is available in your PATH.

If Prettier doesn't work out of the box, navigate to its plugin directory (usually `~/.local/share/nvim/site/pack/native/start/vim-prettier`) and run `yarn install` manually.