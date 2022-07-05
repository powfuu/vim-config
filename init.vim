"		============= EVERIT MOLERO NVIM PLUGINS ============
"		Web Development
"		Android Development
"		Database Development
"		Syntax & Colorschemes
"		Nvim Complete Setup

call plug#begin(expand('~/.vim/plugged'))
"Animated Buffers
Plug 'camspiers/animate.vim'
Plug 'lewis6991/impatient.nvim'

Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'


"Dark minimalist modern colorscheme
Plug 'wadackel/vim-dogrun'


"Soft Dark one dark theme
Plug 'joshdick/onedark.vim'

"Float Term inside nvim
Plug 'voldikss/vim-floaterm'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Icons for vim
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'

"Initial Screen
Plug 'mhinz/vim-startify'

"Navigate between matchups
Plug 'andymass/vim-matchup'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"top bar
Plug 'romgrk/barbar.nvim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'

"navigation between buffers
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

"Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Fast movement between words & lines
Plug 'easymotion/vim-easymotion'

"bottom line plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Errors display >> arrows
Plug 'dense-analysis/ale'

"Auto close pairs
Plug 'jiangmiao/auto-pairs'

"Sessions management vim
Plug 'xolox/vim-session'

Plug 'hail2u/vim-css3-syntax'

"Preview Colors easy
Plug 'gko/vim-coloresque'

"Plenary Lua Support
Plug 'nvim-lua/plenary.nvim'

"vim-misc Support plugins
Plug 'xolox/vim-misc'

"Telescope for finding files/hidden files & explore and fast search/previews
Plug 'nvim-telescope/telescope.nvim'

Plug 'mlaursen/vim-react-snippets'
call plug#end()

syntax on
let NERDTreeShowLineNumbers=1
set t_Co=256
colorscheme dogrun
set termguicolors
set encoding=UTF-8
set fileencodings=utf-8
set ttyfast
set backspace=indent,eol,start
set expandtab
let mapleader=','
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

set ruler
let no_buffers_menu=1

set wildmenu

" Mouse support
set mouse=a
set mousemodel=popup

set guioptions=egmrti
set gfn=Monospace\ 10
"" Disable the blinking cursor.

set gcr=a:blinkon0

set scrolloff=3


"" Status bar
set laststatus=3

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv


vmap <C-x> "+y

set clipboard=unnamedplus

" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines

"" Remember cursor position

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

inoremap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set autoread

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

if !executable('tmux')
  let g:loaded_vimux = 1
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" html
" for html files, 2 spaces
autocmd Filetype html,js,jsx setlocal ts=2 sw=2 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END

"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.rc.local"))
  source ~/.rc.local
endif


"*****************************************************************************
"" Convenience variables
"*****************************************************************************
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
  
  let g:session_autoload='no'

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

setl nospell
setl nowrap
setl tabstop=4
setl shiftwidth=4
setl smartindent

let b:vcm_tab_complete = 'javascript'
let b:javascript_fold = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
set ai
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tabnine', 'coc-eslint']  " list of CoC extensions needed

set relativenumber

"nmap <silent> <M-Right> :call animate#window_delta_width(8)<CR>
"nmap <silent> <M-Left> :call animate#window_delta_width(-8)<CR>
"nmap <silent> <M-Down> :call animate#window_delta_width(12)<CR>
"nmap <silent> <M-Up> :call animate#window_delta_width(-12)<CR>
nmap <silent> <A-l> :call animate#window_delta_width(-12)<CR>
nmap <silent> <A-h> :call animate#window_delta_width(12)<CR>
nmap <silent> <A-Up> :call animate#window_delta_height(-8)<CR>
nmap <silent> <A-Down> :call animate#window_delta_height(8)<CR>
nmap <silent> <S-r> :NERDTreeToggle :NERDTreeFocus <CR> 
nmap <silent> <S-d> :NERDTreeFocus<CR> :vertical resize 35 <CR>
nmap <silent> <A-.> :tabnew<CR>
nmap <silent> <A-'> :set scl=no<CR>
nmap <silent> <A-;> :set scl=yes<CR>
nmap <silent> <A-m> :w <CR>
nmap <silent> <S-h> :BufferPrevious<CR>
nmap <silent> <S-l> :BufferNext<CR>
nmap <silent> <S-j> :BufferMovePrevious<CR>
nmap <silent> <S-k> :BufferMoveNext<CR>
nmap <silent> <TAB> :bnext<CR>
nmap <silent> <S-TAB> :bprevious<CR>
nnoremap <silent> <S-q> :bw <CR> :vsplit <CR> :BufferNext<CR>
nnoremap <silent> <S-w> :q <CR>
nnoremap <silent> <A-c> :FloatermToggle<CR>
nmap <silent><S-m> :mks!<CR>
cnoreabbrev tree NERDTree
cnoreabbrev t ter
cnoreabbrev n noh
cnoreabbrev s split
cnoreabbrev d vsplit
nmap <silent> <S-A-l> :vsplit<CR>
nmap <silent> <S-A-k> :split<CR>
nnoremap <silent> f <cmd>Telescope find_files theme=ivy<CR>
cnoreabbrev f <cmd>Telescope find_files hidden=true theme=ivy<CR>

let g:floaterm_title = ""
let g:floaterm_position = "center"
"let g:floaterm_borderchars = ""

set numberwidth=1


inoremap <silent> ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>

set nobackup
set nowritebackup

set cmdheight=1

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <silent> <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


command! -nargs=0 Format :call CocActionAsync('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

set re=1
au CursorMoved
augroup vimrc_autocmd
  autocmd!
  "toggle quickfix window
  autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>|map <buffer> <c-p> <up>|map <buffer> <c-n> <down>

  autocmd FileType unite call s:unite_settings()
  " obliterate unite buffers (marks especially).
  autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

  " Jump to the last position when reopening a file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


augroup END
set lazyredraw
set cursorline
highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=White guibg=yellow gui=NONE
"signature.target": "echo"
let g:airline_powerline_fonts = 1
noremap <A-k> 42k
noremap <A-j> 42j
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
:silent
let NERDTreeMinimalUI=1
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
set signcolumn=yes
if filereadable(expand("~/.rc.local.bundles"))
  source ~/.rc.local.bundles
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

let g:airline_theme='transparent'

set cursorline
"set cursorlineopt=number
set nocompatible
syntax enable
set background=dark
highlight Cursor guifg=#84F8CC guibg=#84F8CC
set scl=no
autocmd syntax * 
        \ let a=0+system("wc -L ".expand("%")."|awk '{printf $1}'") |
        \ if a >= 9999999999999 |
        \    syntax off |
        \ endif
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
autocmd VimEnter * set winfixwidth
set updatetime=250
nnoremap <ESC> :noh <CR>
highlight SignColumn guibg=NONE
function! HighlightWordUnderCursor()
    let disabled_ft = ["qf", "fugitive", "nerdtree", "gundo", "diff", "fzf", "floaterm"]
    if &diff || &buftype == "terminal" || index(disabled_ft, &filetype) >= 0
        return
    endif
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
      hi MatchWord cterm=undercurl gui=undercurl guibg=#3b404a
        exec 'match' 'MatchWord' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

augroup MatchWord
  autocmd!
  autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
augroup END
set nobackup
set nowritebackup


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <silent> <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <silent> <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <silent> <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <silent> <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

hi Directory guifg=#a8d2eb guibg=NONE
"#a8d2eb
"
"set cursorline
nnoremap <silent> ,. daw
nnoremap <silent> . caw
nnoremap <silent> <S-A-q> :qall<CR>
nnoremap <silent> <S-A-m> :wqall<CR>

:resize
highlight clear StatusLine

"HIDE NERD TREE STATUS BAR <<< BOTTOM


autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd VimEnter * NERDTree | wincmd p


au VimEnter * NERDTreeToggle
fu s:disable_lightline_on_nerdtree() abort
   let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
   call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu
set number

:set wrap linebreak
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#2a2c3f ctermbg=335

set signcolumn=number
set signcolumn=yes

autocmd BufEnter NERD_tree_* let g:NERDTreeWinSize = 35

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"TODO: MODERN THEME VIM
highlight LineNr guifg=#6a6c8f
hi CursorLineNr guifg=#73c1a9

hi TabLineSel guifg=#9ea4c2 ctermfg=235 guibg=#2e3343 ctermbg=104 gui=bold cterm=bold
hi TabLine guifg=#9ea4c2 ctermfg=235 guibg=#1e2230 ctermbg=104 gui=bold cterm=bold
hi TabLineFill guifg=#8085a6 guibg=#3e4554 ctermbg=104 gui=bold cterm=bold
"
hi Comment guifg=#8085a6 ctermfg=60 gui=NONE cterm=NONE

let g:NERDTreeQuitOnOpen=0


filetype plugin indent on

fun s:InComment()
	return stridx(synIDattr(synID(line('.'), col('.')-1, 0), 'name'), 'omment') != -1
endf

" Counts occurance of needle in page, when not in a comment.
fun s:CountInPage(needle)
	let pos = [line('.'), col('.')]
	call cursor(1, 1)
	let counter = search(a:needle, 'Wc')
	while search(a:needle, 'W')
		if !s:InComment() | let counter += 1 | endif
	endw
	call cursor(pos)
	return counter
endf


" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" vim:noet:sw=4:ts=4:ft=vim
"
"" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
" Returns whether a closing tag has already been inserted.
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
require('impatient')
require'impatient'.enable_profile()
_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}
require('impatient')

EOF




" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'


" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


":set fillchars+=vert:\ 
":let g:airline_statusline_ontop=1

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable close button
let bufferline.closable = v:false
" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '  Ξ'
"≒
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_end = v:true
" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 3
