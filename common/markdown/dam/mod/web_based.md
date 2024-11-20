<!--
Web based interface, compared to old-school local application.
-->


# Compiled executable or website?

<aside class="notes">
In the past it was clear that a catalogue would be a database, and the clients
were applications that ran on the clients in the office.

This has its pros and cons, but there are good reasons why it makes sense to
have web-based access to your DAM.
</aside>



# Does it do Web?

  * Is the client browser-based?
  * How hard/easy/possible to serve a web frontend?
    <small>(APIs, components, programming language, ...)</small>
  * Which operating system(s) are used/required?
  * Does it provide eg a "[REST API](https://en.wikipedia.org/wiki/Representational_state_transfer)"?
  * Any license restrictions?

<aside class="notes">
A classic example:

If the MAM client is browser-based, and the server engine runs on GNU/Linux OS
with standard (=well known, well documented, well supported, FOSS-licensed)
components, and provides proper and documented interfaces, having or
implementing a web-interface option is way easier than if it requires a
less-web-thinking OS like Windows or proprietary licenses or proprietary
interfaces.

Some MAMs provide a "backend" for in-house use, and a separate "frontend" for
web-access already.
</aside>



# From Local Catalogue to Web Access

> Which level of separated/interconnected do you want/need?

  * 1 common database (DB)?
  * 2 DBs, synchronized: how? + how often?
  * What about the content (files)?
  * Who may access (read/write/edit) what?

