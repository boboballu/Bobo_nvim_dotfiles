# TGK : unserstanding OSC 52 clipboard and enable it's support to paste in tmux

 - tested oscclip
    - 0.4.1 works with tmux V3.3a, but slow
    - 0.5.0 - The latest version doesn't work with tmux3.3a


- kitten clipboard -g # didn't work
- No other solution worked for me when pasting to tmux sdtin

Common solutions online:

tmux config recommendations:
```conf
# for kitten clipboard working [on, external, off]
set -g set-clipboard on

set -g allow-passthrough on
```

Already set the above config - still kitten clipboard doesn't work
