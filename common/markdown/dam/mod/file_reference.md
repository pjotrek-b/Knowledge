
# Reference between Catalogue and Files

  * How are catalogue entries related to files (and vice-versa)?
  * How (in)dependent of the catalogue can files be used/modified?


# Filename &amp; Folder structure

  * Many DAMs do that automatically.
  * In a non-human readable layout ([UUIDs](https://en.wikipedia.org/wiki/Universally_unique_identifier)).
  * Which level of control do you need over this?
  * Got external workflows accessing the files/data?


# Files intact, but DAM gone?

![If your files have PIDs, you're lucky!](../../../images/misc/needle-in-haystack.jpg)

<aside class="notes">
It's good practice to somehow embed vitally necessary metadata with/inside your files that may help to identify and (re-)assign them if they got "lost" in the wild.

For example, having its "title" and some form of persistent identifier (PID) with your files, makes your data setup more robust against critical database or other failures.

See  "[Heritage PID Resources](https://tanc-ahrc.github.io/PIDResources/)" for more information on how to create and use PIDs.
</aside>

