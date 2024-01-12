# Custom clear for ncurses \e[3j issue
function fish_clear_preserve_scrollback --description "C-l puts \e[3J in terminal, which clears scrollback buffer. This fun is binded to Ctrl + l"	
	#if test $TERM_PROGRAM="tmux"
	#	tput clear
	#else
	#	printf \e\[H\e\[2J ; commandline -f repaint
	#end
	printf \e\[H\e\[2J ; commandline -f repaint
end
