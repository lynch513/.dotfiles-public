--------------------------------------------------------------------------------------------
-- An example for a nvim/init.lua file (Neovim edition)
--   Maintainer: lynch513@yandex.ru
--------------------------------------------------------------------------------------------
-- Reload this config file -> :so %

local cmd = vim.cmd             -- execute Vim commands
local fn = vim.fn
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--------------------------------------------------------------------------------------------
--| # Plugins
--------------------------------------------------------------------------------------------

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
[[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]],
false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  ----------------------------------------------------------------------------------------
  --| ## Основные
  ----------------------------------------------------------------------------------------

  ----------------------------------------------------------------------------------------
  --| ### Комменты
  ----------------------------------------------------------------------------------------
  use 'b3nj5m1n/kommentary'
  ----------------------------------------------------------------------------------------
  --| ### Fuzzy search
  ----------------------------------------------------------------------------------------
  use { 'nvim-telescope/telescope.nvim',
  requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  config = function()
      require('telescope').setup()
  end, }
  ----------------------------------------------------------------------------------------
  --| ### Icons
  ----------------------------------------------------------------------------------------
  use 'kyazdani42/nvim-web-devicons'
  ----------------------------------------------------------------------------------------
  --| ### Цветовая схема
  ----------------------------------------------------------------------------------------
  -- use 'sainnhe/everforest'
  -- use 'shaunsingh/solarized.nvim'
  use 'shaunsingh/nord.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'lunarvim/darkplus.nvim'
  ----------------------------------------------------------------------------------------
  --| ### Информационная строка внизу
  ----------------------------------------------------------------------------------------
  use { 'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'nord'
      }
    }
  end, }
  ----------------------------------------------------------------------------------------
  --| ### Табы вверху
  ----------------------------------------------------------------------------------------
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('bufferline').setup{}
  end, }
  ----------------------------------------------------------------------------------------
  --| ### Файловый менеджер
  ----------------------------------------------------------------------------------------
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('nvim-tree').setup {
      open_on_tab = true,
    }
  end, }
  ----------------------------------------------------------------------------------------
  --| ### Навигация внутри файла по классам и функциям
  ----------------------------------------------------------------------------------------
  -- use 'majutsushi/tagbar'
  ----------------------------------------------------------------------------------------
  --| ### Add indentation guides even on blank lines
  ----------------------------------------------------------------------------------------
  use { 'lukas-reineke/indent-blankline.nvim',
  config = function()
    require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
      char = '|',
      space_char = '⋅',
      filetype_exclude = { 'help', 'packer' },
      buftype_exclude = { 'terminal', 'nofile' },
      char_highlight = 'LineNr',
      show_trailing_blankline_indent = true,
    }
  end, }

  ----------------------------------------------------------------------------------------
  --| ### Add git related info in the sign columns and popups
  ----------------------------------------------------------------------------------------
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { hl = 'GitGutterAdd', text = '+' },
        change = { hl = 'GitGutterChange', text = '~' },
        delete = { hl = 'GitGutterDelete', text = '_' },
        topdelete = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' },
      }
    }
  end, }

  ----------------------------------------------------------------------------------------
  --| ## LSP и автодополнялка
  ----------------------------------------------------------------------------------------

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Автодополнялка
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  --- Автодополнлялка к файловой системе
  use 'hrsh7th/cmp-path'
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-cmdline'
  use "rafamadriz/friendly-snippets"

  ----------------------------------------------------------------------------------------
  -- ## HTML и CSS
  ----------------------------------------------------------------------------------------

  -- Подсвечивает закрывающий и открывающий тэг.
  -- Если, где-то что-то не закрыто, то не подсвечивает.
  use 'idanarye/breeze.vim'
  -- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1>
  use 'alvan/vim-closetag'
  -- Подсвечивает #ffffff
  use 'ap/vim-css-color'

  ----------------------------------------------------------------------------------------
  -- ## РАЗНОЕ
  ----------------------------------------------------------------------------------------

  -- Даже если включена русская раскладка vim команды будут работать
  use 'powerman/vim-plugin-ruscmd'
  -- 'Автоформатирование' кода для всех языков
  use 'Chiel92/vim-autoformat'
  -- ]p - вставить на строку выше, [p - ниже
  use 'tpope/vim-unimpaired'
  -- Переводчик рус - англ
  use 'skanehira/translate.vim'
  --- popup окошки
  use 'nvim-lua/popup.nvim'
  -- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
  use 'tpope/vim-surround'
  -- Считает кол-во совпадений при поиске
  use 'google/vim-searchindex'
  -- Может повторять через . vimsurround
  use 'tpope/vim-repeat'
  -- Стартовая страница, если просто набрать vim в консоле
  use 'mhinz/vim-startify'
  -- Обрамляет строку в теги по ctrl- y + ,
  use 'mattn/emmet-vim'
  -- Закрывает автоматом скобки
  use 'cohama/lexima.vim'
  -- Линтер, работает для всех языков
  use 'dense-analysis/ale'
  -- Highlight trailing whitespaces
  use 'ntpeters/vim-better-whitespace'
end)

--------------------------------------------------------------------------------------------
--| # Keymaps
--------------------------------------------------------------------------------------------

-- map('i', 'jj', '<Esc>', {noremap = true})

-- Tabs and buffets keymaps
map('n', '[b', ':bprevious<CR>', {noremap = true, silent = true})
map('n', ']b', ':bnext<CR>', { noremap = true, silent = true })
map('n', '[t', ':tabprevious<CR>', { noremap = true, silent = true })
map('n', ']t', ':tabnext<CR>', { noremap = true, silent = true })

-- Add empty lines
-- map('n', ']<Space>', 'm`o<Esc>`', { noremap = true, silent = true })
-- map('n', '[<Space>', 'm`O<Esc>`', { noremap = true, silent = true })

-- Remap Esc
map('i', '<C-l>', '<Esc>', { noremap = true, silent = true })

-- Set leader key
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- Set line numbers
map('n', '<leader>sn', ':set invnumber<CR>', { noremap = false, silent = true })

-- Show invisible chars
map('n', '<leader>sc', ':set list!<CR>', { noremap = false, silent = true })

-- Strip whitespaces
map('n', '<leader>ss', ':StripWhitespace<CR>', { noremap = true, silent = true })

-- Spell checking
map('n', '<F7>', ':set spell!<CR>', { noremap = false, silent = true })

-- No highlight
map('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })

-- telescope settings
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>]], { noremap = true, silent = true })
map('n', '<C-f>', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
map('n', '<leader>lg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

-- NvimTree
map('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

--------------------------------------------------------------------------------------------
--| # Settings
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
--| ## Главные
--------------------------------------------------------------------------------------------

opt.inccommand = 'nosplit'        -- show the effects of a command incrementally in the buffer
opt.hlsearch = true               -- set highlight on search
opt.hidden = true                 -- do not save when switching buffers
-- opt.mouse = 'a'                   -- enable mouse mode
-- opt.breakindent = true            -- enable break indent

--opt.colorcolumn = '80'            -- Разделитель на 80 символов
opt.cursorline = true             -- Подсветка строки с курсором
opt.spelllang= { 'en_us', 'ru' }  -- Словари рус eng
opt.number = true                 -- Включаем нумерацию строк
-- opt.relativenumber = true         -- Вкл. относительную нумерацию строк
opt.undofile = true               -- Возможность отката назад
opt.splitright = true             -- vertical split вправо
opt.splitbelow = true             -- horizontal split вниз

opt.ignorecase = true             -- case insensitive search
opt.smartcase = true              -- unless /C or capital in search

opt.updatetime = 250              -- decrease update time
vim.wo.signcolumn = 'yes'

--------------------------------------------------------------------------------------------
--| ## Цветовая схема
--------------------------------------------------------------------------------------------

opt.termguicolors = true      --  24-bit RGB colors

g.nord_contrast = true
g.nord_borders = false
g.nord_disable_background = true
g.nord_italic = false

g.doom_contrast = true
g.doom_borders = false
g.doom_disable_background = true
g.doom_italic = false

g.moonlight_italic_comments = false
g.moonlight_italic_keywords = false
g.moonlight_italic_functions = false
g.moonlight_italic_variables = false
g.moonlight_contrast = true
g.moonlight_borders = false
g.moonlight_disable_background = true

cmd 'colorscheme nord'

--------------------------------------------------------------------------------------------
--| ## Табы и отступы
--------------------------------------------------------------------------------------------

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.softtabstop = 4
opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd 'autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype javascriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype xml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype xhtml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype scss setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2'

opt.list = true
opt.listchars:append('lead:⋅')

--------------------------------------------------------------------------------------------
--| ## Полезные фишки
--------------------------------------------------------------------------------------------

-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

--------------------------------------------------------------------------------------------
--| ## Разное
--------------------------------------------------------------------------------------------

-- Направление перевода с русского на английский
-- g.translate_source = 'ru'
-- g.translate_target = 'en'
-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
-- g.tagbar_compact = 1
-- g.tagbar_sort = 0

--------------------------------------------------------------------------------------------
--| ## Ale linters
--------------------------------------------------------------------------------------------

-- Конфиг ale + eslint
-- g.ale_fixers = { javascript= { 'eslint' } }
-- g.ale_sign_error = '❌'
-- g.ale_sign_warning = '⚠️'
g.ale_fix_on_save = 1
-- Запуск линтера, только при сохранении
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

--------------------------------------------------------------------------------------------
--| ## LSP settings
--------------------------------------------------------------------------------------------

local nvim_lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'solargraph', 'intelephense' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ["<C-j>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ["<C-k>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

