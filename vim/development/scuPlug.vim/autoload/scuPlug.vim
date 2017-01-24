" vim-plug: Vim plugin manager
" ============================
"
" folk of vim-plug
" rewritten in lua
"
" Mainly for my own entertainment!
"
"
" Copyright (c) 2015 scu
"
"
"
" MIT License {{{1
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" Default Plugin Init {{{1
if exists('g:loaded_scuPlug')
  finish
endif

let g:loaded_scuPlug = 1
let s:cpo_save = &cpo
set cpo&vim

" Script Vars {{{1
let s:plug_src = 'https://github.com/junegunn/vim-plug.git'
let s:plug_tab = get(s:, 'plug_tab', -1)
let s:plug_buf = get(s:, 'plug_buf', -1)
let s:mac_gui = has('gui_macvim') && has('gui_running')
let s:is_win = has('win32') || has('win64')
let s:py2 = has('python') && !has('nvim') && !s:is_win && !has('win32unix')
let s:ruby = has('ruby') && !has('nvim') && (v:version >= 703 || v:version == 702 && has('patch374'))
let s:nvim = has('nvim') && exists('*jobwait') && !s:is_win
let s:me = resolve(expand('<sfile>:p'))
let s:base_spec = { 'branch': 'master', 'frozen': 0 }
let s:TYPE = {
\   'string':  type(''),
\   'list':    type([]),
\   'dict':    type({}),
\   'funcref': type(function('call'))
\ }
let s:loaded = get(s:, 'loaded', {})
let s:triggers = get(s:, 'triggers', {})


" Helper Functions {{{1

function! s:to_a(v)
endfunction

function! s:to_s(v)
endfunction

function! s:source(from, ...)
endfunction

function! s:assoc(dict, key, val)
endfunction

function! s:loaded_names()
endfunction

function! s:reload()
endfunction

function! s:trim(str)
endfunction

function! s:version_requirement(val, min)
endfunction

function! s:git_version_requirement(...)
endfunction

function! s:progress_opt(base)
endfunction

if s:is_win
  function! s:rtp(spec)
  endfunction

  function! s:path(path)
  endfunction

  function! s:dirpath(path)
  endfunction

  function! s:is_local_plug(repo)
  endfunction
else
  function! s:rtp(spec)
  endfunction

  function! s:path(path)
  endfunction

  function! s:dirpath(path)
  endfunction

  function! s:is_local_plug(repo)
  endfunction
endif

function! s:err(msg)
endfunction

function! s:esc(path)
endfunction

function! s:escrtp(path)
endfunction

function! s:remove_rtp()
endfunction

function! s:reorg_rtp()
endfunction



" Init {{{1
function! scuPlug#begin(...) 
  return 1
endfunction

function! scuPlug#end()
endfunction

function! s:remove_triggers(name)
endfunction

function! s:lod(names, types)
endfunction


function! s:lod_ft(pat, names)
endfunction

function! s:lod_cmd(cmd, bang, l1, l2, args, names)
endfunction

" Commands {{{1 
function! s:define_commands()
endfunction

function! s:lod_map(map, names, prefix)
endfunction

function! s:add(repo, ...)
endfunction

function! s:parse_options(arg)
endfunction

function! s:infer_properties(name, repo)
endfunction

function! s:install(force, names)
endfunction

function! s:update(force, names)
endfunction

function! plug#helptags()
endfunction

function! s:syntax()
endfunction

function! s:lpad(str, len)
endfunction

function! s:lines(msg)
endfunction

function! s:lastline(msg)
endfunction

function! s:new_window()
endfunction

function! s:plug_window_exists()
endfunction

function! s:switch_in()
endfunction

function! s:switch_out(...)
endfunction

function! s:prepare()
endfunction

function! s:assign_name()
endfunction

function! s:do(pull, force, todo)
endfunction

function! s:finish(pull)
endfunction

function! s:retry()
endfunction

function! s:is_managed(name)
endfunction

function! s:names(...)
endfunction

function! s:update_impl(pull, force, args) abort
endfunction

function! s:update_finish()
endfunction

function! s:job_abort()
endfunction

function! s:job_handler(job_id, data, event) abort
endfunction

function! s:spawn(name, cmd, opts)
endfunction

function! s:reap(name)
endfunction

function! s:bar()
endfunction

function! s:logpos(name)
endfunction

function! s:log(bullet, name, lines)
endfunction

function! s:tick()
endfunction

function! s:update_ruby()
endfunction

function! s:shellesc(arg)
endfunction

function! s:glob_dir(path)
endfunction

function! s:progress_bar(line, bar, total)
endfunction

function! s:compare_git_uri(a, b)
endfunction

function! s:format_message(bullet, name, message)
endfunction

function! s:with_cd(cmd, dir)
endfunction

function! s:system(cmd, ...)
endfunction

function! s:system_chomp(...)
endfunction

function! s:git_valid(spec, check_branch)
endfunction

function! s:rm_rf(dir)
endfunction

function! s:clean(force)
endfunction

function! s:upgrade()
endfunction

function! s:upgrade_specs()
endfunction

function! s:status()
endfunction

function! s:extract_name(str, prefix, suffix)
endfunction

function! s:status_load(lnum)
endfunction

function! s:status_update() range
endfunction

function! s:is_preview_window_open()
endfunction

function! s:find_name(lnum)
endfunction

function! s:preview_commit()
endfunction

function! s:section(flags)
endfunction

function! s:diff()
endfunction

function! s:revert()
endfunction

function! s:snapshot(...) abort
endfunction

function! s:split_rtp()
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save



" Default Plugin End{{{1
let &cpo = s:cpo_save
unlet s:cpo_save

