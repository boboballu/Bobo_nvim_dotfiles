#####       fish custom finctions     ###
#####       Author: Tarungovindk      ###
## Date :###### Sun Feb 27 18:46:48 PST 2022
## Note: (1) one function per file; (2) file name must match function name
#  
function Z_pico_hist_search --description "Z_pico_hist_search - recursive search in history; ESC to exit"
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
