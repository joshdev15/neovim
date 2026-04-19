# Neovim Configuration

**Updated to NVIM v0.12.1**

## Overview / Resumen

<details open>
<summary><b>English 🇬🇧</b></summary>

This Neovim configuration uses Lua as its main language. It provides a modern, fast, and feature-rich development environment focusing on Lua, Go, and Web development (TypeScript/React).

This configuration is tested on **Neovim v0.12.1** and is mainly set up to work on Linux or MacOS. Take precautions if you plan to use it on a different OS.
</details>

<details>
<summary><b>Español 🇪🇸</b></summary>

Esta configuración de Neovim utiliza Lua como lenguaje principal. Proporciona un entorno de desarrollo moderno, rápido y rico en funciones, centrado en Lua, Go y desarrollo Web (TypeScript/React).

Esta configuración está probada en **Neovim v0.12.1** y está configurada principalmente para funcionar en Linux o MacOS. Toma precauciones si planeas usarla en un sistema operativo diferente.
</details>

---

## Documentation / Documentación

To keep this README clean, detailed instructions and lists have been separated into specific files. Please select your language:

Para mantener este README limpio, las instrucciones detalladas y las listas se han separado en archivos específicos. Por favor, selecciona tu idioma:

### 🇬🇧 English
- 📖 **[Installation & Prerequisites](docs/en/installation.md):** Detailed guide on required software, moving files, and the first-run experience.
- 📦 **[Dependencies & Plugins](docs/en/dependencies.md):** A complete list of the plugins and tools powering this configuration.

### 🇪🇸 Español
- 📖 **[Instalación y Requisitos](docs/es/installation.md):** Guía detallada sobre el software necesario, cómo mover los archivos y la experiencia del primer uso.
- 📦 **[Dependencias y Plugins](docs/es/dependencies.md):** Una lista completa de los plugins y herramientas que impulsan esta configuración.

---

## Quick Start / Inicio Rápido

<details open>
<summary><b>English 🇬🇧</b></summary>

If you already have the prerequisites installed, here is a quick summary:

1. Clone or download this repository.
2. Move the contents (`init.lua` and `lua/` folder) to your Neovim config path:
   ```bash
   $HOME/.config/nvim/
   ```
3. Open Neovim. The plugin manager ([Lazy.nvim](https://github.com/folke/lazy.nvim)) will install automatically and pull all the plugins.
4. Run `:Mason` to install LSPs, formatters, and linters.
5. Treesitter will automatically compile the parsers on the first run.

Enjoy your new Neovim setup!
</details>

<details>
<summary><b>Español 🇪🇸</b></summary>

Si ya tienes los requisitos instalados, aquí tienes un resumen rápido:

1. Clona o descarga este repositorio.
2. Mueve el contenido (el archivo `init.lua` y la carpeta `lua/`) a la ruta de configuración de tu Neovim:
   ```bash
   $HOME/.config/nvim/
   ```
3. Abre Neovim. El gestor de plugins ([Lazy.nvim](https://github.com/folke/lazy.nvim)) se instalará automáticamente y descargará todos los plugins.
4. Ejecuta `:Mason` para instalar los LSPs, formateadores y linters.
5. Treesitter compilará automáticamente los parsers en la primera ejecución.

¡Disfruta de tu nueva configuración de Neovim!
</details>