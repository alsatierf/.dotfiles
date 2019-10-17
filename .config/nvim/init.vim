call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'scrooloose/nerdTree'
  Plug 'tpope/vim-surround'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

let mapleader=","

" Formatting
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them. // set this to 80~120 if required
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.
  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.

" Enable mouse support (move cursor with mouse)
  set mouse=a

" Configure backup and swap
  set nobackup            " no backup files
  set noswapfile          " no swap files
  set wildignore=*.swp,*.bak,*.pyc,*.class

" Colorscheme options.
  set bg=dark
  colorscheme gruvbox

" Relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

" Toggle between normal and relative numbering.
  nnoremap <leader>r :call NumberToggle()<cr>

" Deoplete plugin key mapping
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" NERDTree plugin key mapping
  nmap <C-n> :NERDTreeToggle<CR>

" Easymotion plugin key mapping
  map <Leader> <Plug>(easymotion-prefix)

" CtrlP plugin key mapping
  " Open file menu
    nnoremap <Leader>o :CtrlP<CR>
  " Open buffer menu
    nnoremap <Leader>b :CtrlPBuffer<CR>
  " Open most recently used files
    nnoremap <Leader>f :CtrlPMRUFiles<CR>
