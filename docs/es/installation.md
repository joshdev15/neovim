# Instalación y Requisitos

Esta configuración requiere que ciertos programas estén instalados en tu sistema operativo antes de que puedas usarla correctamente.

## 1. Requisitos Previos

Asegúrate de tener instalado lo siguiente en tu sistema:

- **[Neovim](https://neovim.io/):** Por favor, usa la versión más reciente de Neovim (se recomienda v0.12.1 o superior).
- **[Git](https://git-scm.com/):** Requerido por el gestor de paquetes nativo para descargar los plugins y para la integración general con Git.
- **[Node.js](https://nodejs.org/):** Preferiblemente una versión reciente (se recomienda LTS). Algunos servidores LSP (como `ts_ls` y `html`) y formateadores (como Prettier) requieren Node.js.
- **[Go (Golang)](https://go.dev/) (Opcional):** Requerido solo si vas a usar el plugin `go.nvim` y el LSP de Go (`gopls`).
- **[Yarn](https://yarnpkg.com/) (Opcional):** Requerido solo para instalar las dependencias de `vim-prettier`.
- **Nerd Font (Opcional pero muy recomendado):** Requerido para mostrar los iconos correctamente en Nvim-Tree y Lualine. Puedes descargar una desde [Nerd Fonts](https://www.nerdfonts.com/). *(Esta configuración ha sido probada específicamente con **[JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)**).*

## 2. Estructura de Directorios

Una vez que descargues este repositorio, debes colocarlo en la carpeta de configuración correcta para Neovim:

```bash
# En Linux/MacOS
$HOME/.config/nvim/
```

Puedes verificar la ruta de tu `$HOME` con:

```bash
echo $HOME
```

Mueve el contenido de este repositorio (la carpeta `lua/` y el archivo `init.lua`) a `$HOME/.config/nvim`.

## 3. Primera Ejecución e Instalación de Plugins

1. Abre una terminal e inicia Neovim:
   ```bash
   nvim
   ```

2. El **Gestor de Paquetes Nativo** (el script `lua/plugins.lua`) se inicializará automáticamente y comenzará a clonar todos los repositorios necesarios en `~/.local/share/nvim/site/pack/native/start/`.

3. Espera a que termine la instalación. Es recomendable reiniciar Neovim después de la instalación inicial.

## 4. Configuración de LSP y Herramientas (Mason)

Esta configuración utiliza Mason para gestionar LSPs, Linters y Formateadores.

1. Dentro de Neovim, ejecuta:
   ```vim
   :Mason
   ```
2. Puedes instalar los servidores faltantes directamente desde la interfaz de Mason. Según la configuración (`lua/lsp.lua`), los siguientes servidores intentarán inicializarse automáticamente si están disponibles:
   - `gopls` (Go)
   - `ts_ls` (TypeScript/JavaScript)
   - `html`
   - `cssls`

## 5. Configuración del Resaltado de Sintaxis (Treesitter)

Treesitter proporciona un mejor resaltado de sintaxis.

1. La configuración está establecida para asegurar automáticamente los parsers para: `go`, `lua`, `typescript`, `tsx`, `javascript`, `html` y `css`.
2. Si necesitas instalar un lenguaje específico manualmente, usa:
   ```vim
   :TSInstall <lenguaje>
   ```
   Ejemplo: `:TSInstall python`

> **Nota para usuarios de Apple Silicon (M1/M2/M3):** 
> Asegúrate de que tu terminal se esté ejecutando de forma nativa y NO usando Rosetta, de lo contrario la compilación de Treesitter podría generar errores.

## 6. Configuración de Prettier

La configuración incluye Prettier. Asegúrate de que `yarn` esté disponible en tu PATH.

Si Prettier no funciona de inmediato, navega hasta el directorio de su plugin (generalmente `~/.local/share/nvim/site/pack/native/start/vim-prettier`) y ejecuta `yarn install` manualmente.