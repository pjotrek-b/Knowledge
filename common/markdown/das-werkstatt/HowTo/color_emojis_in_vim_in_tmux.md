# HowTo get colored unicode emojis displayed properly in vim (on Debian)

1. apt install fonts-noto-color-emojis

2. dpkg-reconfigure locales: choose a default language (for $LANG) to contain the letters 'utf-8'. Example: `en_US@UTF-8`

3. start tmux with `tmux -u` (to force UTF-8)
(I had LANG=C set, therefore tmux was confused and fell back to *latin1*.)

4. In vim `:set encoding=utf-8`.
Should render the characters properly.


On my setup putting encoding=utf-8 in vimrc.local does not work (yet).
