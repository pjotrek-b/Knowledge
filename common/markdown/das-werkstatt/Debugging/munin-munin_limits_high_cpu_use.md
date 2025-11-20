# Problem

The following process showing up with 100% CPU usage over a looooong time, on a regular munin-node:

`/usr/bin/perl /usr/share/munin/munin-limits`


The process did NOT stop, when stopping the munin-node service:

`$ systemctl stop munin-node`


I had to manually kill it.
Then the load went back to normal.


# Solution?

I don't know yet, what caused this issue.

However, I was able to fix it:

  * Stop Munin node service: `systemctl stop munin-node`
  * Kill the rogue process: `kill -9 <PID>`
    (find the <PID>: `ps aux | grep munin-limits`)
  * Clear /all/ munin data folders:
    * `rm -rf /var/run/munin/*`
    * `rm -rf /var/lib/munin/*`
    * `rm -rf /var/log/munin/*`
    * `rm -rf /var/cache/munin/www/*`
  * Start Munin node service again: `systemctl start munin-node`

The issue proooobaaably happened in the first place, because I was changing hostnames involved in munin/munin-node configuration, because it was a fresh server setup.

Changing hostnames very much confuses munin (for good reasons), and it's best to wipe everything and start fresh if you did that.


WARNING: This will make you lose all previous monitoring values/graphs gathered by munin, so I recommend doing this as early as possible when you setup fresh munin-nodes, so you can easily reset without crying.


Good luck!
It will work fine.
