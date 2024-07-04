# Neovim

**Updated to**
NVIM v0.10.0
Build type: Release
LuaJIT 2.1.1713484068

## My Neovim settings

This configuration uses Lua as its main language.

The Lua programming language is supported by Neovim since version **0.5.0**, so it
is recommended that you upgrade to a higher version than the one mentioned
above.

Please use the most recent version of Neovim.
This configuration is tested on Neovim v0.10.0.

This configuration is mainly set up to work on Linux or MacOS,
take your precautions if you will use it on a different OS.

It is also necessary to have the following programs installed and configured;

- [Git](https://git-scm.com/)
- [Nodejs (preferably a recent version)](https://nodejs.org/)
- [Packer.nvim](https://github.com/wbthomason/packer.nvim)
- [FZF](https://github.com/junegunn/fzf)
- [Silver Searcher](https://github.com/ggreer/the_silver_searcher)

Remember to set your environment variables and binary locations correctly.

You can install any lsp server with :LspInstallInfo nvim command

## Steps to use

### Download

Once you download this repository, you need to locate it in the correct folder,
which is:

```java
$HOME/.config/nvim/
```

You can see what your $HOME is with the following command:

```bash
echo $HOME
```

You must relocate the child folders and files (lua/, plugin/, init.lua) from the
root folder to the $HOME/.config/nvim folder

### Packer

Once this step is ready and assuming that you have a recent version of nvim
installed on your system, you must open an instance of the editor and run the
command:

```bash
:PackerSync
```

with the command option of ":".

The previous command will install the libraries and plugins so that the editor
is ready to use.

### LSP and Mason

Once the installation is complete, you can run the following command:

```bash
:Mason
```

Which will allow you to install: LSP, Linterns and Formatters
of many languages for your editor through a fairly comfortable
interface. Which will make its use much easier.

### Treesitter

**Important**

If you are running MacOS with Apple Silicon processors
(M1, M2 or M3), you need to install the tree-packages from
a terminal that is not running Rosetta, because it will
generate errors.

Then I highly recommend installing Treesitter, which helps
improve syntax highlighting of many languages

You can do it with the following command:

```javascript
:TSInstall <language>
```

example:

```javascript
:TSInstall javascript
```

You can see the available languages using the command: TSInstallInfo, I
recommend: 'tsx', 'javascript', 'typescript', 'json5', 'css', 'html', 'go', 'rust', 'dart'
and the other one or others you want.

Enjoy!
