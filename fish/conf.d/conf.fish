#####       fish custom finctions     ###
#####       Author: Tarungovindk      ###
## Date :###### Sun Feb 27 18:46:48 PST 2022

## maintained by - tarungovindk

# Basic core util aliases
alias ll 'ls -lrt'

## TMUX aliases ##
#alias tmux 'TERM=xterm-256color /home/tarungovindk/bin/tmux'
alias tmux_source 'tmux source-file ~/.tmux.conf'
function tmux_pname --description "tmux_pname <pane_name>"  
	eval "printf '\033]2;%s\033\\'"
end
alias tmux 'tmux -u'
alias tmux_mouse_on 'tmux set mouse on'
alias tmux_mouse_off 'tmux set mouse off'
alias tmux_session 'tmux new -s '
alias tmux_tree 'tmux choose-tree'

alias abspath 'readlink -e '


