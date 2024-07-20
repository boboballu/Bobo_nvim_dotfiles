# Bobo_nvim_dotfiles
This repo contains my neovim, fish and tmux dot files dotfiles
 
 - Last backup : 14th Feb 2024

 - Dependencies:
  - fzf
  - nvim
  - tmux

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

Jan-24-2024 :
    nvim :
        - added ufo plugin that handles vscode like folds
        - fixed auto complete when pressing enter in vim-cmp
        - tmux - clipboard fixes. Resurrecting some old configs and disable C-a as prefix2
Jan-25-2024 :
    Karabiner :
        - Karabiner elements config added to the repo. This config excludes all the vnc tools and terminal emulators like kitty, iterm2 etc.
        - Updated the mac "finder" to use the default keymapings
        - Added commented_sections.json that holds all the don't use keymappings. This in a separate file becsuse the json config doesn't accept comments.

Feb-09-2024 :
    Clipboard management : clipboard_select.sh
        - The x11 clipboard xclip in kitty fails for unknown reason. Kitty offers clipboard in 'kitten clipboard' application and I wanted to switch the clipboard to 'kitten clipboard' if the x11 xclip fails.
        - The testing of the clipboard is buggy that if kills the x11 xclip if it already worked fine. Butchers the x11 forwarding entirely.
        - Set the default x11 server to be x11 in kitty settings
            "linux_display_server X11"
        - The code is not complete and needs some testing and corrections. The "kitten clipboard" check fails

Mar-18-2024 :
    tmux:
        - Tmux dotfiles changed to $HOME/.config dir

Future plans :
    Mar-18-2024 :
        - Make the dotfiles simple and lightweight
        - try catppuccin theme selection tool for nvim and tmux
        - remove unnecessary clutter in dotfiles
        - replace ❐ to the OS icon and change the tmux airline theme for OS automatically.
