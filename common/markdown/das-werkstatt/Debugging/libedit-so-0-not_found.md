# libedit.so.0 not found

The .bashrc/profile of a user, was copied as-is from an older version of a previous operating system.
In there it had a call to an old binary (which pointed to an outdated version of libedit)

libedit.so.2 was present (on Debian13), but on the previous RHEL it was libedit.so.0.


You may encounter any library name causing this confusion.

Simply remember:
If some program/process insists on a certain library version - which is prior to yours - check if some program is called that "doesn't belong" in that version of your OS environment...
