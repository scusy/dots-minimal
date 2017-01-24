" vimrc -----------------------------------------------------------------------
" Johannes Lahann -------------------------------------------------------------
" Last Changed: 2015-09-16 -----------------------------------------------------


" Pluginmanager {{{1
call plug#begin('~/.cache/vim-plug')
Plug 'scusy89/scala.vim' " in development
Plug 'scusy89/vim-journal' " in development
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-dispatch'
Plug 'othree/html5.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-projectionist'
Plug 'junegunn/seoul256.vim'
Plug 'gelguy/Cmd2.vim'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
"Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vader.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-scriptease'
Plug 'lervag/vimtex'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimfiler.vim'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'plasticboy/vim-markdown'
call plug#end()

" Settings {{{1
set laststatus=2
set statusline=%f       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through fileset nocp
set colorcolumn=80
set shiftwidth=2
set softtabstop=2
set noswapfile
set mouse=a
set splitright
set foldmethod=marker
set backspace=2
set clipboard=unnamedplus
let mapleader=","
let maplocalleader="-"
set foldmethod=marker
set expandtab
set number
set hidden
set listchars=tab:▸\ ,trail:·
set list

" Colorscheme {{{1 
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 234
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 256
let g:seoul256_background = 233
colorscheme seoul256
" Mappings {{{1
nn <enter> o<esc>
nn <leader>sv :so ~/.vimrc<cr>
nn <leader>ev :e ~/.vimrc<cr>
nn <leader>en :e ~/.notes/notes2016.notes<cr>
nn <space> za
nn <c-a> <esc>ggVG<cr>
nn <leader>s :
nn <leader>ex :	:VimFiler -buffer-name=explorer -explorer -project -auto-expand
		\ -split -simple -winwidth=35 -toggle -no-quit <cr>
nn <leader>d :bd<cr>
nn <leader>v :vnew<cr>
nn <leader>go :GoyoEnter<cr>
nn <leader>gc :GoyoLeave<cr>
nn <del> "_x
noremap <C-P> @:<CR>
inoremap <del> <c-o>"_x
noremap L $
noremap H 0

nn <leader>f <nop>
nn <leader>cd :cd %:h<cr>:pwd<cr>
command! -nargs=1 -complete=help VHelp  :vert h <args>
nnoremap gf :FZF --query <cfile><CR>
vnoremap P "0p
nn P "0p
vnoremap <f2> yq:pIechom(<esc>A)<esc><cr>
nn <leader>ff :FZF<cr>
nn <leader>fd :FZFDirs<cr>
nn <leader>fa :Ag 

" German Keyboard {{{1
map ü <C-]>
map ö [
map ä ]
map Ö {
map Ä }
map ß /
" Latex {{{1
" Compiler for latex 
" requires rubber
function! ServerVimSettings()
" dont close vim retard!
cnoremap q<cr> echo "Nope, take it slow!"<cr>
cnoremap q! echo "Nope, take it slow!"
cnoremap wq eco "Nope", take it slow!"
endfunction
function! InitLatex()
  setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
  if filereadable('Makefile')
    setlocal makeprg=make
  else
    exec "setlocal makeprg=make\\ -f\\ ~/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
  endif
endfunction
augroup latex
  autocmd!
  autocmd Filetype plaintex :set filetype=tex
  autocmd Filetype tex,plaintex nn <buffer> <localleader>m :silent make!\|redraw!\|cw<cr>
  autocmd Filetype tex,plaintex :call InitLatex() 
augroup END
" Typescript {{{1
augroup typescript
autocmd!
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
augroup END

" Vim {{{1
augroup vim
  autocmd!
  autocmd Filetype vim set expandtab
  autocmd Filetype vim set sw=2
  autocmd Filetype vim set tabstop=2
augroup END
function! InitLog(pa)
  let b:logpath=a:pa
  call system("echo ".a:pa. " > ".$HOME."/.cache/vim-logs/".b:logpath .".vimlog")
  call system("echo ------------------------------------------------------ >> ".$HOME."/.cache/vim-logs/".b:logpath .".vimlog")
endfunction 
function! MyLog(id,val)
  call system("echo ".a:id.": ".a:val. " >> ".$HOME."/.cache/vim-logs/".b:logpath .".vimlog")
endfunction



" Notes {{{1

augroup notes
  autocmd!
  autocmd BufRead *.notes :set filetype=mkd.markdown
augroup END

" Markdown {{{1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
augroup markdown
  autocmd!
  autocmd Filetype mkd.markdown set expandtab
  autocmd Filetype mkd.markdown set sw=2
  autocmd Filetype mkd.markdown set tabstop=2
  autocmd Filetype mkd.markdown set foldmethod=marker
augroup END

" Neocomplete {{{1
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
      \ '\v\\\a*(ref|cite)\a*([^]]*\])?\{([^}]*,)*[^}]*'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><NUL>  pumvisible() ? "\<C-n>" : "\<NUL>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><NUL> pumvisible() ? "\<C-n>" : "\<C-R>=UltiSnips#ExpandSnippet()"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"Ultisnips {{{1
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<NUL>"                                            
let g:UltiSnipsJumpForwardTrigger="<NUL>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-NUL>"   
let g:UltiSnipsEditSplit="vertical"

" Goyo - LimeLight {{{1
function! s:goyo_enter()
  Limelight
  Goyo 100%x100%
  set number
  set colorcolumn=80
endfunction

function! s:goyo_leave()
  Limelight!
  Goyo!
endfunction

command!  GoyoEnter  call <SID>goyo_enter()
command!  GoyoLeave  call <SID>goyo_leave()
command!  Nutrition :e ~/.nutrition.md
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
		let g:vimfiler_ignore_pattern = ['^\.git$', '^\target$']
augroup MyAutoCmd
autocmd!
autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings() 
  nmap <buffer> l <Plug>(vimfiler_expand_or_edit)
endfunction
" Spell checking {{{1
function! s:en_spell_local()
  setlocal spell
endfunction

command!  SpellEnglish call <SID>en_spell_local()

" Unite {{{1

" Yank History
let g:unite_source_history_yank_enable = 1
nnoremap <leader>uy :Unite history/yank<cr>

" FZF Options {{{1
"
"  {{{2   :Ag searchkey -> Just an awesome recursive in file search
" function! s:ag_to_qf(line)
"   let parts = split(a:line, ':')
"   return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
"         \ 'text': join(parts[3:], ':')}
" endfunction
"
" function! s:ag_handler(lines)
"   if len(a:lines) < 2 | return | endif
"
"   let cmd = get({'ctrl-x': 'split',
"                \ 'ctrl-v': 'vertical split',
"                \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
"   let list = map(a:lines[1:], 's:ag_to_qf(v:val)')
"
"   let first = list[0]
"   execute cmd escape(first.filename, ' %#\')
"   execute first.lnum
"   execute 'normal!' first.col.'|zz'
"
"   if len(list) > 1
"     call setqflist(list)
"     copen
"     wincmd p
"   endif
" endfunction
" command! FZFGf call fzf#run({
" \ 'source':  printf('ag --nogroup --column --color "%s"',
" \                   expand('<cword>')),
" \ 'sink*':    function('<sid>ag_handler'),
" \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
" \            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
" \            '--color hl:68,hl+:110',
" \ 'down':    '50%'
" \ })
" command! -nargs=* Ag call fzf#run({
" \ 'source':  printf('ag --nogroup --column --color "%s"',
" \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
" \ 'sink*':    function('<sid>ag_handler'),
" \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
" \            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
" \            '--color hl:68,hl+:110',
" \ 'down':    '50%'
" \ })
"
"
" :FZFLines {{{2   -> Search lines in all open Buffers
" function! s:line_handler(l)
"   let keys = split(a:l, ':\t')
"   exec 'buf' keys[0]
"   exec keys[1]
"   normal! ^zz
" endfunction
"
" function! s:buffer_lines()
"   let res = []
"   for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
"     call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
"   endfor
"   return res
" endfunction
"
" command! FZFLines call fzf#run({
" \   'source':  <sid>buffer_lines(),
" \   'sink':    function('<sid>line_handler'),
" \   'options': '--extended --nth=3..',
" \   'down':    '60%'
" \})
" :BTags {{{2   -> Jump to tags in the current buffer
" function! s:align_lists(lists)
"   let maxes = {}
"   for list in a:lists
"     let i = 0
"     while i < len(list)
"       let maxes[i] = max([get(maxes, i, 0), len(list[i])])
"       let i += 1
"     endwhile
"   endfor
"   for list in a:lists
"     call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
"   endfor
"   return a:lists
" endfunction
"
" function! s:btags_source()
"   let lines = map(split(system(printf(
"     \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
"     \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
"   if v:shell_error
"     throw 'failed to extract tags'
"   endif
"   return map(s:align_lists(lines), 'join(v:val, "\t")')
" endfunction
"
" function! s:btags_sink(line)
"   execute split(a:line, "\t")[2]
" endfunction
"
" function! s:btags()
"   try
"     call fzf#run({
"     \ 'source':  s:btags_source(),
"     \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
"     \ 'down':    '40%',
"     \ 'sink':    function('s:btags_sink')})
"   catch
"     echohl WarningMsg
"     echom v:exception
"     echohl None
"   endtry
" endfunction
"
" command! BTags call s:btags()
"
" :Tags {{{2   -> Jump to tags
"
" function! s:tags_sink(line)
"   let parts = split(a:line, '\t\zs')
"   let excmd = matchstr(parts[2:], '^.*\ze;"\t')
"   execute 'silent e' parts[1][:-2]
"   let [magic, &magic] = [&magic, 0]
"   execute excmd
"   let &magic = magic
" endfunction
"
" function! s:tags()
"   if empty(tagfiles())
"     echohl WarningMsg
"     echom 'Preparing tags'
"     echohl None
"     call system('ctags -R')
"   endif
"
"   call fzf#run({
"   \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
"   \            '| grep -v ^!',
"   \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
"   \ 'down':    '40%',
"   \ 'sink':    function('s:tags_sink')})
" endfunction
"
" command! Tags call s:tags()
" :FZFMru {{{2   ->  Most recently used Files
" command! FZFMru call fzf#run({
" \ 'source':  reverse(s:all_files()),
" \ 'sink':    'edit',
" \ 'options': '-m -x +s',
" \ 'down':    '40%' })
"
" function! s:all_files()
"   return extend(
"   \ filter(copy(v:oldfiles),
"   \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
"   \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
" endfunction
" :FZFLines {{{2   -> Select buffer
"  function! s:buflist()
"   redir => ls
"   silent ls
"   redir END
"   return split(ls, '\n')
" endfunction
"
" function! s:bufopen(e)
"   execute 'buffer' matchstr(a:e, '^[ 0-9]*')
" endfunction
"
" command! FZFBuffer  call fzf#run({
" \   'source':  reverse(<sid>buflist()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>buflist()) + 2
" \ })<CR>
"
" :Locate  {{{2   -> locate all files on filesystem :)
" command! -nargs=1 Locate call fzf#run(
"       \ {'source': 'locate -r  <q-args>', 'sink': 'e', 'options': '-m'})
"
" FZFDir{{{2   -> open directory
" command! FZFDirs call fzf#run(
"       \ {'source': 'find . -type d 2> /dev/null' , 'sink': 'VimFiler', 'options': '+m'})
"
"
"
" Peekaboo Cmdline {{{1
function! s:Peekaboo()
    call peekaboo#peek(1, 'ctrl-r',  0)
endfunction

let g:Cmd2_cmd_mappings = {
    \ 'Peekaboo': {'command': function('s:Peekaboo'), 'type': 'function'},
    \ }

cmap <C-R> <Plug>(Cmd2)Peekaboo
" Cmd2 {{{1
nmap : :<F12>
nmap / /<F12>
cmap <F12> <Plug>(Cmd2Complete)

" RMM {{{1
command! RMM exec "!java -jar ~/scripts/rmm.jar cli ".getline(".")
command! SH exec "!".getline(".")

" LightLine {{{1
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
