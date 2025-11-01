# Option to have molly-guard ask for Fully Qualified Domain Name: The "long" hostname.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=658282

Thanks to, Andrew!
Here's a copy from [bug-report #658282 website](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=658282) on Debian:


    Debian Bug report logs - #658282
    molly-guard: configuration option to use FQDN
    version graph

    Package: molly-guard; Maintainer for molly-guard is Simó Albert i Beltran <sim6@probeta.net>; Source for molly-guard is src:molly-guard (PTS, buildd, popcon).

    Reported by: Andrew Pollock <apollock@debian.org>
    Date: Wed, 1 Feb 2012 19:27:01 UTC

    Severity: wishlist
    Tags: patch

    Found in version molly-guard/0.4.4-2
    Fixed in version molly-guard/0.6.0
    Done: Francois Marier <francois@debian.org>
    Bug is archived. No further changes may be made.


How nice and great is that?
There! Just like that:

> "Hey, what about a really useful thing being able to do something else really useful - in its context - and I could even provide resources like time, money and patches and testing.

And then, it's there.
And once /that/ feature is stable, that use-case worked out - there's no need for updates, really. maintenance yes, but being able to simply "copy everything over", and it "just works": That's reality for FOSS-community hackers of all sorts, and seems like dark-magic for pure enterprise-entrepreneur-engineering-consultant-developers or similar.

Add that feature - and maintain it.
Fix that bug - and enjoy 'more stable'.

Just like that.
Collaboration or Competition?

This is the software-side of #GLAMorous hardware: Tech designed to serve a purpose, and developed and improved well - to a certain point, where it either /is/ plain-stable taken-for-granted 'infrastructure' so to say. Take "ls" or "grep" or "cat", etc etc: Imagine you'd get "new and interesting and time-consuming and resource-grabbing bloat-by-sales and implemented by Dads who required money to provide for life where they live.

# So, molly-guard and FQDN? 🤓️  tell me more...?

Yes, here's how:

  * Edit molly-guard's config file:  
    `sudo vim /etc/molly-guard/rc`

  * There should be 2 config-options listed - but disabled - in that file:

```
ALWAYS_QUERY_HOSTNAME=true
USE_FQDN=true
```

**Set both to *true*!**

Especially when working with remote-remote servers.
`ALWAYS_QUERY_HOSTNAME`: disables /any/ guessing "if SSH" - and now always asks for the hostname. Great for servers!


`USE_FQDN`: I use this for proxmox, virtual machines, LXC containers - all kind of setups, where I spawen a bunch of lightweight virtual server(container)s for a production setup. Like a webserver these days.

In such datacenter cases, we often have structured hostnames - which repeat certain parts in the DNS name, like:

  |-------------------------------- | -------------------|
  | fqdn = cloud.amp(.arkthis.com)  | hostname = "cloud" |
  | fqdn = cloud.volt(.arkthis.com) | hostname = "cloud" |
  |-------------------------------- | -------------------|

Therefore, having molly-guard ask you for "given-and-family name" of your machines, makes you rest assured "you meant /that/ host. And it /is/ the right one.".


Have fun!
