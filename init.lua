-- Configuración básica
vim.opt.clipboard = "unnamedplus" -- Habilitar acceso al portapapeles del sistema
vim.g.mapleader = ' ' -- Definir la tecla líder como espacio

-- Verificar que vim-plug esté instalado y configurar los plugins
vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')

  " Plugins principales
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'

  " Plugins de soporte para PHP y Laravel
  Plug 'phpactor/phpactor', { 'for': 'php', 'do': 'composer install --no-dev -o' } 

  " Plugins para gestionar pestañas
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " Instalacion de temas
  Plug 'goolord/alpha-nvim'
  
  " Funciones de Inteligencia Artifical
  Plug 'olimorris/codecompanion.nvim'
 
  call plug#end()
]]

-- Configuracion de Dashboard
require 'alpha'.setup(require'alpha.themes.dashboard'.config)
-- Configuracion Devicons
require'nvim-web-devicons'.setup {
  default = true; -- Usa íconos por defecto si no hay configuraciones específicas
}

-- Configuracion Codecompanion
require("codecompanion").setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = os.getenv("GEMINI_API_KEY"), 
        },
        schema = {
          model = {
            default = "gemini-1.5-flash",
          },
          temperature = {
            default = 0.7,
          },
          max_tokens = {
            default = 1000,
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "gemini",
   },
 },
  behavior = {
    auto_send = true, 
    auto_close = false
  },
})

-- Mapa de teclas (opcional, pero recomendado):
-- ... otras configuraciones ...
vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ch", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>tg", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- ... más configuraciones ...
-- Configuración básica de barbar.nvim
--vim.g.barbar_auto_setup = false -- Desactiva configuración automática para personalizar
require'barbar'.setup {
  icons = {
    filetype = { -- Aquí puedes especificar iconos adicionales si lo necesitas
      php = '',
      html = '',
      css = '',
    },
  }
}

-- Atajos Varios
vim.keymap.set("n", "<Leader>", ":t.<CR>", { noremap = true, silent = true})
-- Atajos para navegar entre pestañas
vim.api.nvim_set_keymap('n', '<Leader>1', ':BufferGoto 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>2', ':BufferGoto 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>3', ':BufferGoto 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>4', ':BufferGoto 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>5', ':BufferGoto 5<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>c', ':BufferClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferPrevious<CR>', { noremap = true, silent = true })


-- NerdTree: Atajo para abrir/cerrar
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Treesitter: Resaltado de sintaxis avanzado
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "php", "html", "css", "json", "lua", "python", "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Telescope: Atajos para búsquedas
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope commands<CR>', { noremap = true, silent = true })

-- Configuración de CoC.nvim
vim.cmd [[
  " Formateo automatico al guardar
  autocmd BufWritePre * :CocCommand prettier.formatFile
  " Mostrar información flotante
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  " Configuración de mapeos para CoC
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Mapeo para renombrar
  nmap <Leader>rn <Plug>(coc-rename)

  " Diagnósticos (errores y advertencias)
  nmap [g <Plug>(coc-diagnostic-prev)
  nmap ]g <Plug>(coc-diagnostic-next)

  " Mostrar documentación al pasar el cursor
  nnoremap <silent> K :call CocAction('doHover')<CR>

  " Configurar enter para confirmar autocompletado
  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

  " Navegación de autocompletado con Tab y Shift-Tab
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]

-- CoC Extensions: Instalar extensiones automáticamente
vim.cmd [[
  " Lista de extensiones a instalar automáticamente
  let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',      
    \ 'coc-snippets',
    \ 'coc-pyright',   
    \ 'coc-eslint',  
    \ 'coc-prettier'
  \ ]
]]

-- Atajos útiles para Laravel
vim.api.nvim_set_keymap('n', '<Leader>lr', ':e routes/web.php<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>le', ':e .env<CR>', { noremap = true, silent = true })

-- Opciones adicionales para experiencia mejorada
vim.opt.number = true -- Mostrar números de línea
vim.opt.relativenumber = true -- Números relativos
vim.opt.cursorline = true -- Resaltar la línea actual
vim.opt.expandtab = true -- Convertir tabs en espacios
vim.opt.shiftwidth = 2 -- Número de espacios por nivel de indentación
vim.opt.tabstop = 2 -- Tamaño de tabulación
vim.opt.smartindent = true -- Indentación inteligente
vim.opt.termguicolors = true -- Habilitar colores 24-bit

