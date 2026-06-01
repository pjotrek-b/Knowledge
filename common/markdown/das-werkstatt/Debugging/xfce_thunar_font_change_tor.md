# Suddenly my Thunar and all apps I open with it have a weird "serif" font! Help!

In case you're using Tor - or any other sandboxed application able to open "Thunar" in its sanbox (!):
By default, Tor opens a Thunar which has a weird, noticably-different-than-default Font. Like Times New Roman - but on Linux.

**The reason is that the file manager is spawned from within Tor - therefore sandboxed.**

And this causes all kinds of other glitches, when trying to double-click-open any files from within "that sandboxed Thunar instance".

Simply open the same folder on your system /outside/ the sandbox:
Open a regular Thunar.
That's it.
