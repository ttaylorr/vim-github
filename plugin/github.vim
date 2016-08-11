if exists('g:loaded_vim_github')
  finish
endif
let g:loaded_vim_github=1

function! s:open_on_github() range
  let remote = systemlist("git remote get-url origin | sed 's/\.git$//g'")[0]
  let ref = systemlist("git rev-parse HEAD")[0]

  let path = remote . "/tree/" . ref . "/" . @% . '\#L' . a:firstline . "-L" . a:lastline

  execute '!open ' . path
endfunction

command! -range GitHubOpen <line1>,<line2>call s:open_on_github()
