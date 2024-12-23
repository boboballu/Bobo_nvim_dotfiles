" Author: Tarun (tarungovindk) nvim configs "
" Date: Mon Aug 22 09:54:02 PST 2022 ####
" Features:
"	- Mimics vscode's best keybindings
"	- <ctrl + Space> to access most keybindings
"	- whichkey ` to see all keybindings
" Source the basic keybindings from ~/.vimrc (will soon be integrated here)
" source ~/.vimrc.common

" Only special keybindings unique to nvim and plugins are listed here

" vim-plug plugg-in manager
call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
" Plug 'nvim-tree/nvim-tree.lua' "nvim tree - got soo used to nerdtree, chuck this
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/RRethy/vim-tranquille' " Vim disable jump search
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/dag/vim-fish'  "Fish shell script plugin
Plug 'https://github.com/mg979/vim-visual-multi' "multicursor for vim

" Plug 'https://github.com/williamboman/nvim-lsp-installer' "lsp installer - depricated
" start : auto completion plugins
Plug 'https://github.com/neovim/nvim-lspconfig' "lsp config
Plug 'hrsh7th/nvim-compe' "auto completion
Plug 'neovim/nvim-lspconfig' "vim cmp additions
Plug 'hrsh7th/cmp-nvim-lsp' "vim cmp additions
Plug 'hrsh7th/cmp-buffer' "vim cmp additions
Plug 'hrsh7th/cmp-path' "vim cmp additions
Plug 'hrsh7th/cmp-cmdline' "vim cmp additions
Plug 'hrsh7th/nvim-cmp' "vim cmp additions
Plug 'L3MON4D3/LuaSnip' " For luasnip users - snippet engine is must for cmp.
Plug 'rafamadriz/friendly-snippets' " offers vscode like snippets for cmp
Plug 'saadparwaiz1/cmp_luasnip' " For luasnip users - snippet engine is must for cmp.
"end : auto completion plugins

Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'} "toggleterm plugin

Plug 'nvim-lua/plenary.nvim' "prerequisite : telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' } "telescope. nvim grep tool

Plug 'folke/which-key.nvim' "which-key: keymap help menu; invoked with `
Plug 'kyazdani42/nvim-web-devicons' "alpha greeter prerequisite
Plug 'goolord/alpha-nvim' " alpha greeter
Plug 'kevinhwang91/promise-async' " prerequisite : ufo plugin
Plug 'kevinhwang91/nvim-ufo' " vscode like fold unfold
Plug 'williamboman/mason.nvim' " lsp installer is no longer maintained. Moving to mason
Plug 'jbyuki/venn.nvim' " ascii block diagrams
Plug 'supermaven-inc/supermaven-nvim' " AI code completion plugin

" Plug 'anuvyklack/hydra.nvim' " hydra for hydra plugin
" disabled since it uses internet
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' } " copilot like  ai auto completion tool

call plug#end()

set encoding=UTF-8
:colorscheme jellybeans "set theme

" :help map for more info
" <C-x> for ctrl + x and <M-x> for alt + x
" <C-a-x> multi char key bindings doesnt work

" ------------------------------ key maps ------------------------------"

" ---------- NERDTREE keymaps ---------------- "
" NERDTree use the directory of the file in search
" The below autocmd ... is the a horrible way of doing this. better way is to
" add % to NERDTree, NERDTreeToggle ... like below
" autocmd BufEnter * lcd %:p:h

let NERDTreeShowHidden=1
nnoremap <C-t> :NERDTreeToggle %<CR>

" nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-y> :NERDTree %<CR>


" ------------ clipboard configs ------------------- "
"copy and paste to and from clipboard using xclip
"vnoremap <C-c>w ! xclip -sel clip<CR>

" checking copy to system clipboard
set clipboard=unnamedplus
" clipboard mapping
vnoremap <C-c> "+y :let @*=@+<CR>
" first remap the visual block mode
nnoremap b <ESC><C-v>
"+P is to insert before cursor; p is to insert after cursor
noremap <C-v> "+p
inoremap <C-v> <ESC>"+p
" Preserve the clipboard when exiting vim
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . 
            \ ' | xclip -selection clipboard')

" ------------ vim-visual-multi keybindings ------- "
" use C-d like in vscode
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

"------------Toggleterm-----------------"
" Horizontal Scroll
"set sidescroll=1
"map <ScrollWheelLeft> 5z<Left>
"map <ScrollWheelRight> 5z<Right>

" Tarun (tarungovindk) common vimrc file ##
" Sat Feb 26 09:54:02 PST 2022 ####

:set number					" line number
" :set relativenumber		" relative line number
:set autoindent				" Self explanotary
":set splitbelow			" Default split below

" settings below is based on this doc - http://vimcasts.org/episodes/tabs-and-spaces/
:set tabstop=4				" redefine tab as 4 spaces		
:set shiftwidth=4
":set smarttab
":set softtabstop=4
set expandtab
" Enable mouse in nvim
:set mouse=a
"Enable folding with indent as fold boundary
":set foldmethod=indent

" -------------------- VSCode like key bindings ----------------------- "
" shell like - ctrl + a for start of the line (NORMAL and INSERT mode)
noremap <C-a> <ESC>^
inoremap <C-a> <ESC>I

" shell like - ctrl + e to the end of the line (NORMAL and INSERT mode)
noremap <C-e> <ESC>$
inoremap <C-e> <ESC>A

"ctrl + f search (no incremental highlight)
noremap <C-f> <ESC>:set noincsearch<CR><ESC>/
inoremap <C-f> <ESC>:set noincsearch<CR><ESC>/

" shift+arrow selection
nnoremap <S-Up> v<Up>
nnoremap <S-Down> v<Down>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>
vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>
inoremap <S-Up> <Esc>v<Up>
inoremap <S-Down> <Esc>v<Down>
inoremap <S-Left> <Esc>v<Left>
inoremap <S-Right> <Esc>v<Right>

" toggle line number
noremap <C-Space>n <ESC>:set number!<CR>
inoremap <C-Space>n <ESC>:set number!<CR><ESC>I

" Vscode like word wrap
noremap <C-Space>z  <ESC>:set wrap!<CR>
inoremap <C-Space>z <ESC>:set wrap!<CR><ESC>I

" clear search highlight
noremap <C-s> :let @/ = ""<CR>

" select a line with ctrl + l<F8>
nnoremap <C-l> <ESC>V

" Map leader is not for me - I use <C-Space> as a vim prefix
" And have mapped some keys in it.
"Setting leader for special operations
"let mapleader = " "

"toggle relative line number
"noremap <leader>r :set rnu!<CR>
noremap <C-Space>r :set rnu!<CR>
inoremap <C-Space>r :set rnu!<CR>

" show all whitespace, tabs end of lines in a file
" (A-l) to toggle
set listchars=eol:↓,tab:↦\ ,trail:·,extends:…,precedes:…,space:·
noremap <C-Space>l <ESC>:set list!<CR>
inoremap <C-Space>l <ESC>:set list!<CR>I


" Telescope
noremap <C-Space>s <ESC>:Telescope<CR>
inoremap <C-Space>s <ESC>:Telescope<CR>
" Telescope find files
noremap <C-Space>f <ESC>:Telescope find_files cwd=.<CR>
inoremap <C-Space>f <ESC>:telescope find_files cwd=.<CR>
" Telescope live grep
noremap <C-Space>g <ESC>:Telescope live_grep cwd=.<CR>
inoremap <C-Space>g <ESC>:Telescope live_grep cwd =.<CR>


" highlight cursorline
set cursorline

" ----------- Lua instation ---------------- "
lua <<EOF
require "main"
EOF

"-----------Configs not used anymore---------"
""Tagbar plugin
"nmap <F8> :TagbarToggle<CR>
":set completeopt-=preview " For No Previews
"" Vim-tranquille search
"nmap <unique> g/ <Plug>(tranquille_search)

"--Setting .psv file syntax to systemverilog--"
augroup psv_syntax
  au!
  autocmd BufNewFile,BufRead *.psv   set syntax=systemverilog
augroup END

" Disable annoying auto line break
fu! DisableBr()
    set wrap
    set linebreak
    set nolist  " list disables linebreak
    set textwidth=0
    set wrapmargin=0
    set fo-=t
endfu

" Disable line breaks for all file types
:au BufNewFile,BufRead *.* call DisableBr()

let g:markdown_fenced_languages = ['python', 'c', 'cpp', 'lua', 'vim', 'yaml', 'make', 'systemverilog', 'rust']

" using spupermaven - hence disabling cmp for good
:lua require('cmp').setup { enabled = false }

" ----------- custom commands ---------"
" Note: The commands ues cammel case
"
"command! CmpDisable execute lua require('cmp').setup { enabled = false } " this is not working
:command CmpDisable :lua require('cmp').setup { enabled = false }
:command CmpEnable :lua require('cmp').setup { enabled = true }
" :command CmpAiDisable :lua requre('cmp').setup { sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } } }

"enable supermaven and / or cmp
:command AiOnly execute ':SupermavenStart' | execute ':CmpDisable' 
:command AiCmp execute ':SupermavenStart' | execute ':CmpEnable'
:command AiDisable execute ':SupermavenStop' | execute ':CmpDisable'

