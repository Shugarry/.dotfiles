" Keymaps
nnoremap <C-s> :wa<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-t> :term<CR>

" Visual mode remaps
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
xnoremap < <gv
xnoremap > >gv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap <leader>p "_dP
nnoremap Q <nop>

" Clipboard yank/delete (only works if Vim has +clipboard)
xnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
xnoremap <leader>d "_d
nnoremap <leader>d "_d

" Search and replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Clear search highlights
nnoremap <Esc> :nohlsearch<CR>

" Settings
set number
set relativenumber
set mouse=a
set colorcolumn=80
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set history=1000
set termguicolors
set noswapfile
set scrolloff=10
set nowrap
set updatetime=50
set timeoutlen=300
set splitright
set splitbelow
set cursorline
set undofile
set ignorecase
set smartcase
set confirm
set signcolumn=yes
set breakindent
set background=dark
colorscheme rosepine

" Enable transparency by default
hi Normal ctermbg=none guibg=NONE
hi NormalNC ctermbg=none guibg=NONE
hi SignColumn ctermbg=none guibg=NONE
hi VertSplit ctermbg=none guibg=NONE

let g:transparent_enabled = 1

function! ToggleTransparency()
  if g:transparent_enabled
    hi Normal ctermbg=NONE guibg=#1e1e1e
    hi NormalNC ctermbg=NONE guibg=#1e1e1e
    hi SignColumn ctermbg=NONE guibg=#1e1e1e
    hi VertSplit ctermbg=NONE guibg=#1e1e1e
    let g:transparent_enabled = 0
    echo "Transparency OFF"
  else
    hi Normal ctermbg=none guibg=NONE
    hi NormalNC ctermbg=none guibg=NONE
    hi SignColumn ctermbg=none guibg=NONE
    hi VertSplit ctermbg=none guibg=NONE
    let g:transparent_enabled = 1
    echo "Transparency ON"
  endif
endfunction

command! Togglet call ToggleTransparency()

" Clipboard support (only if compiled with +clipboard)
if has("clipboard")
  set clipboard=unnamedplus
endif
