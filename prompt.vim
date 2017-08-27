" sections (a, b, c, x, y, z, warn) are optional
        "\'a' : [ promptline#slices#user(), promptline#slices#host() ],
let g:promptline_preset = {
        \'a' : [ '\u@\h' ],
        \'b' : [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'z' : [ promptline#slices#last_exit_code(), promptline#slices#jobs() ],
        \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery({ 'threshold': 15 }) ]}

fun! promptline#themes#powerlineclone#get()
  return {
        \'a'      : [231, 31],
        \'b'      : [231, 25],
        \'c'      : [250, 240],
        \'x'      : [250, 236],
        \'y'      : [250, 236],
        \'z'      : [250, 236],
        \'warn'   : [231, 52]}
endfun

PromptlineSnapshot! bash_prompt
quit

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
" promptline#slices#conda_env() - display which conda env is active (empty is none)
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`
