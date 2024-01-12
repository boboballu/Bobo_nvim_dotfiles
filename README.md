# Bobo_nvim_dotfiles
This repo contains my neovim, fish and tmux dot files dotfiles
- Tmux Config -
    Pre-requisites: 
        Needs Tmux and Oh my Tmux. The tmux conf is based on the ph my tmux project - https://github.com/gpakosz/.tmux
    Installation: 
        cp tmux.conf.local ~/.tmux.conf.local
        Restart tmux or source in the current session: tmux source-file ~/.tmux.conf.local

- Fish config -
    Pre-requisites:
        Needs Fish shell, fzf
    Installation:
        cp -r fish ~/.config/fish

- Nvim config -
    Installation:
        cp -r nvim ~/.config/nvim 


Sept-4-2022 :
 - Moved all the .vimrc.common keybindings to init.vim
 - added some additional keybindings under <C-Space> 
	{Toggleterm, Telescope, space-tab-nl markers, rnu, ans so-on. Just enter <C-Space> and lookput for which key suggestions}



