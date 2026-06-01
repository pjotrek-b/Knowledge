# HowTo use `zfs list` to show only datasets (without snapshots)?

I have zfs-auto-snapshot creating tons of useful snapshots. Hourly, daily, etc.

By default "zfs list" shows all datasets AND their snapshots.
Which makes it quite unreadable (for everyone, like me, using having lots of snapshots).

# Show only filesystems:

Here's a solution:

`zfs list -t filesystem`

Shows no snapshots. Great!

I wonder why the default of `zfs list` is showing snapshots, when there's a parameter to SHOW them, but none to HIDE them?
