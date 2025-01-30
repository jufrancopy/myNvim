
# Configuración de Neovim

Este repositorio contiene la configuración personalizada de Neovim con diversos plugins y ajustes para mejorar la productividad, especialmente enfocado en PHP y Laravel, así como para desarrolladores en general.

## Requisitos

Asegúrate de tener lo siguiente instalado en tu sistema:

- **Neovim**: La versión más reciente de Neovim.
- **Vim-Plug**: El gestor de plugins para Neovim.
- **PHP**: Para utilizar algunos plugins de soporte como `phpactor/phpactor`.

## Instalación

1. **Instalar Neovim**:
   
   Si no tienes Neovim instalado, puedes instalarlo siguiendo la documentación oficial de [Neovim](https://neovim.io/).

2. **Instalar Vim-Plug**:
   
   Ejecuta el siguiente comando para instalar Vim-Plug:

   ```bash
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. **Clonar este repositorio**:

   Si tienes el repositorio en GitHub, clónalo a tu directorio de configuración de Neovim:

   ```bash
   git clone <URL-DE-TU-REPOSITORIO> ~/.config/nvim
   ```

4. **Instalar Plugins**:

   Abre Neovim y ejecuta el siguiente comando para instalar los plugins:

   ```vim
   :PlugInstall
   ```

5. **Configuración de los plugins**:

   Algunos plugins necesitan configuraciones adicionales. Estos ya están predefinidos en los archivos de configuración de Neovim. Asegúrate de tener las dependencias necesarias, como `composer` para `phpactor`.

## Explicación de la Configuración

La configuración incluye los siguientes elementos:

- **Vim-Plug** para la gestión de plugins.
- **Plugins principales**: como `coc.nvim`, `NERDTree`, `telescope.nvim`, `nvim-treesitter`, entre otros.
- **Soporte para PHP y Laravel** mediante plugins como `phpactor/phpactor`.
- **Configuración de barras de pestañas** y **funcionalidad de iconos** con `barbar.nvim` y `nvim-web-devicons`.
- **Integración de Inteligencia Artificial** con el plugin `codecompanion.nvim`.
- **Atajos personalizados** para facilitar la navegación y el trabajo en Neovim.

## Atajos de Teclado

Algunos de los atajos configurados incluyen:

- `<Leader>ff` para buscar archivos con `telescope`.
- `<Leader>fg` para buscar texto en archivos con `telescope`.
- `<Leader>fb` para ver los buffers abiertos.
- `<Leader>lr` para abrir `routes/web.php` en un proyecto Laravel.
- `<Leader>le` para abrir el archivo `.env` de Laravel.
- **Navegar entre buffers** con las teclas `<Leader>1`, `<Leader>2`, ..., `<Leader>5`.

## Notas Adicionales

- **Dashboard**: La pantalla de inicio está configurada con `alpha-nvim` para mostrar un panel de bienvenida al iniciar Neovim.
- **Treesitter**: Resaltado de sintaxis avanzado está habilitado para varios lenguajes como PHP, HTML, CSS, Lua, entre otros.
- **CodeCompletion**: CoC.nvim proporciona autocompletado y navegación de código inteligente.

¡Espero que esta configuración te ayude a mejorar tu flujo de trabajo con Neovim!
