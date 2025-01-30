
# Neovim y Gemini AI

Este repositorio contiene mi configuración personalizada de Neovim. Utilizo una serie de plugins para mejorar mi productividad en el desarrollo de software, incluyendo soporte para varios lenguajes, administración de archivos, autocompletado, y herramientas avanzadas de Inteligencia Artificial (IA).

## Requisitos

- [Neovim 0.5+](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug) como gestor de plugins.
- Tener configuradas las claves de la API de Gemini para usar la integración de CodeCompanion.

## Instalación

1. **Clona este repositorio en tu máquina**:
   ```sh
   git clone https://github.com/tu_usuario/neovim-config.git ~/.config/nvim
   ```

2. **Instalar los plugins**:
   Abre Neovim y ejecuta:
   ```vim
   :PlugInstall
   ```

   Esto instalará todos los plugins que he configurado.

3. **Configura tu API Key de Gemini**:
   Para usar la funcionalidad de CodeCompanion, necesitas configurar tu clave de API de Gemini. 
   Puedes obtenerla en [Gemini](https://gemini.com) y agregarla en tu entorno como una variable de entorno:
   ```sh
   export GEMINI_API_KEY="tu_clave_aqui"
   ```

4. **Reinicia Neovim**.

## Configuración

### 1. **Plugins Principales**:
   - `coc.nvim`: Herramienta de autocompletado para muchos lenguajes de programación.
   - `nerdtree`: Administrador de archivos en forma de árbol.
   - `nvim-treesitter`: Mejoras en el resaltado de sintaxis.
   - `telescope.nvim`: Búsquedas avanzadas de archivos, buffers y más.
   - `alpha-nvim`: Dashboard de inicio de Neovim.
   - `codecompanion.nvim`: Integración con modelos de Inteligencia Artificial (IA) como Gemini para generar código y respuestas.

### 2. **Atajos Personalizados**:
   Aquí te explico algunos de los atajos que tengo configurados en mi entorno:

   - **Navegación en Pestañas**:
     - `<Leader>1`, `<Leader>2`, ..., `<Leader>5`: Ir a la pestaña 1, 2, 3, 4 o 5.
     - `<Leader>c`: Cerrar la pestaña actual.
     - `<Tab>`: Ir a la pestaña siguiente.
     - `<S-Tab>`: Ir a la pestaña anterior.

   - **NerdTree**:
     - `<Leader>n`: Abrir o cerrar NerdTree.

   - **CodeCompanion (Integración con IA)**:
     - `<Leader>ch`: Iniciar una conversación con el modelo IA de Gemini.
     - `<Leader>tg`: Activar/desactivar el chat de CodeCompanion en la vista actual.
     - `ga`: Agregar texto a la conversación de IA.

   - **Búsquedas con Telescope**:
     - `<Leader>ff`: Buscar archivos.
     - `<Leader>fg`: Buscar contenido dentro de archivos.
     - `<Leader>fb`: Buscar buffers abiertos.
     - `<Leader>fc`: Buscar comandos disponibles.

   - **CoC (Autocompletado)**:
     - `gd`: Ir a la definición de un símbolo.
     - `gy`: Ir a la definición del tipo de un símbolo.
     - `gr`: Ver las referencias de un símbolo.

   **Nota sobre CodeCompanion**: Este plugin se conecta a la API de Gemini para interactuar con modelos de Inteligencia Artificial. Puedes generar texto, obtener explicaciones sobre fragmentos de código, y más. Para usar esta funcionalidad, asegúrate de tener configurada tu clave de API de Gemini como se explicó anteriormente.


## Contribuciones

Si tienes alguna sugerencia de mejora o quieres compartir tus propias configuraciones, no dudes en crear un "pull request" o abrir un "issue" en este repositorio.

## Licencia

MIT License.
