# Problem

Fresh install of MX-Linux 23.6 on Virtualbox6 (Host OS: Xubuntu 20.04.6) - all 64bit:

I've configured the power manager and screensaver settings to suspend after some minutes, and always lock the screen when doing so (suspend and screensaver).

Now, leaving the VM running to install large packages, I find it with a black-screen: Which I expected.
What I **did not expect** however, was that: nothing would give me the GUI again: no mouse movement, no keyboard keys, not even soft-keyboard (provided by vbox UI) would do anything.

I couldn't SSH into that machine (yet), because vbox was NAT'ing it to a subnet I couldn't reach from the host that easily. Otherwise, I'd ssh in, and see if I could do anything - or `poweroff` clean at least.


# Solution

After giving up, I selected `Machine > ACPI Shutdown`, hoping for a graceful, yet "blind" shutdown.

**SURPRISE! O.O**

The GUI returned, and showed me a login-prompt to unlock my session.
Awesome. All well.


However, the issue remains this kind of "lockout" /should not happen/ in the first place.

If you have any ideas, please let me know :)

