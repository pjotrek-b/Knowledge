# HowTo save a tmux window layout for tmuxinator

I wanted to do the following:

  * Custom adjust tmux window+pane layouts to suit my taste
  * Save that session to tmuxinator

Steps to do that:

  1. Open a new tmux session: `tmux`
  2. Split the window: `Ctrl-B + "`, or `Ctrl-B + %`
  3. Detach: `Ctrl-B d`
  4. Get tmux' windows geometry:
     `tmux list-windows`
     Copy paste the layout into your clipboard (starting after the word 'layout')
  5. Edit the tmuxinator project "gpumon":
     `tmuxinator edit gpumon`
     And paste the layout from your clipboard
  
`tmux list-windows` gives you something like:

```
0: monitoring* (2 panes) [211x54] [layout 438a,211x54,0,0[211x23,0,0,1,211x30,0,24,2]] @1 (active)
```

Which translates to this in tmuxinator:

```
# Simple nvtop/btop monitoring screen (GPU-, LLM-tuning)
# /home/arkthis/.config/tmuxinator/gpumon.yml

name: gpumon
root: ~/

windows:
  - monitoring:
      #layout: even-vertical
      layout: 438a,211x54,0,0[211x23,0,0,1,211x30,0,24,2]
      panes:
        - nvtop
        - btop
```

Should do the trick.
Have fun!


Thanks to: ["Templating tmux with tmuxinator" (by Simon van Dyk), 2019-03-13](https://thoughtbot.com/blog/templating-tmux-with-tmuxinator) for the tip about `tmux list-windows`.
