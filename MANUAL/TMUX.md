####### Author : tarungovindk #########
######## A tiny manual for tmux #############

## TMUX ##
tmux prefix ==> C-b ==> <Ctrl + b>

-- The below is the tmux project config used --
# https://github.com/gpakosz/.tmux

Layout:

+--------------------------------------+
|--------------------------------------|
||                    ||              ||
||                    ||              ||
||                    ||              ||
||                    ||              ||
||                    ||p2            ||
||                    |----------------|
||                    |----------------|
||                    ||              ||
||                    ||              ||
||                    ||              ||
||                    ||              ||
||                    ||              ||
||p1                  ||p3            ||
|--------------------------------------|
|--------------------------------------+
||s1 ||  w1   ||  w2    |              |
+--------------------------------------+

s1          - Session               ## look for session section for commands and shortcuts
w1, w2      - windows in a session  ## look for window section for commands and shortcuts
p1, p2 , p3 - Panes in a window     ## Look for pane section for pane commands and shortcuts


general:
 - shortcut : C-b ?                 ## list all the keboard shortcuts
 - commands : tmux <command>        ## runs commands from a shell - can use this to attach, detach, kill-sessio, ls and so-on
 - shortcut : C-b [                 ## visual copy select mode - press arrow keys (up arrow) to scroll with keyboard
 - shortcut : C-b [ space           ## To select text with keyboard, space is for text selection
 - shortcut : C-b ]                 ## To copy the selected text in the above method to tmux clipboard. Just press y to copy to system clipboard

mouse:
 - mouse mode is supported and the selection works without any issues. The mouse also works in nvim.
 - nvim clipboard is merged with the system clipboard. When ssh-ing make sure to pass -Y flag to ssh and make sure the 
   $display is set in ssh server (eg : $display = localhost:10.0)

session:
 - shortcut : C-b + $               ## to rename a session
 - shortcut : C-b + d               ## detach a session
 - shortcut : C-b + s               ## browse to sessions, windows and panes and attach the session of choice
 - commands : tmux                  ## by default creates a session with numbers when spawn
 - commands : tmux ls               ## list all sessions running - shell executable command
 - commands : tmux attach-session -t <session name>
 - commands : tmux kill-session -t <session name>

window:
 - shortcut : C-b + c               ## new window
 - shortcut : C-b + ,               ## rename window
 - shortcut : C-b + &               ## kill window
                                            
pane:                                       
 - shortcut : C-b + -               ## vertical split - in y axis
 - shortcut : C-b + _               ## horizontal split - in x axis
 - shortcut : C-b + { and C-b + }   ## } rotate the current pane clockwise and { rotates the current pane anti-clockwise
 - shortcut : C-b + space           ## organizes based on the available layouts
 - commands : list-panes            ## lists panes in current window 

advanced pane <==> window commands
 - commands : break_pane            ## detaches the current pane in selection from a window and creates a new window
 - commands : join_pane -t <dest_window> ## move a pane from the existing window to dest_window
