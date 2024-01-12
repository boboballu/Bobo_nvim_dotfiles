function fish_user_key_bindings
	bind \cl fish_clear_preserve_scrollback # ctrl + l keybinding
	#bind -M insert \ck kill-line # bring back emacs style <C-k> in insert mode
	bind \ca beginning-of-line
	bind \ce end-of-line
	# peco
  # bind \cr Z_pico_hist_search # Bind for peco select history to Ctrl+R
  # bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F

  # vim-like
  # bind \cl forward-char

  # prevent iterm2 from closing when typing Ctrl-D (EOF)
  # bind \cd delete-char
end

fzf_key_bindings
