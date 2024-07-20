#####       fish custom finctions     ###
#####       Author: Tarungovindk      ###
## Date :###### Sun Feb 27 18:46:48 PST 2022

## maintained by - tarungovindk

# Basic core util aliases
alias ll 'ls -lrt'

## TMUX aliases ##
#alias tmux 'TERM=xterm-256color /home/tarungovindk/bin/tmux'
alias tmux_source 'tmux source-file ~/.tmux.conf'
alias tmux 'tmux -u'
alias tmux_mouse_on 'tmux set mouse on'
alias tmux_mouse_off 'tmux set mouse off'
alias tmux_session 'tmux new -s '
alias tmux_tree 'tmux choose-tree'

alias abspath 'readlink -e '
alias icat "kitten icat "
# The file ~/custom_fish_config.fish is sourced if available
# This helps maintain the dotfiles separate from the machine specific customizations.

if test -d ~/custom_fish_config.fish
    source ~/custom_fish_config.fish
end



