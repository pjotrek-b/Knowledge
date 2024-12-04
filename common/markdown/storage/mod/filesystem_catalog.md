
# Filesystem = MAM?

  * An annotated filesystem **is an actual catalogue**
  * If implemented well, the storage itself may be a future DAM/MAM.
    (key/value metadata in the filesystem)
  * Links/relationships between objects = 🤯🤠🥳
  * Combined with LoD, MD Standards & APIs = Wikidata for your files.
  * No more distance between file and its catalogue entry.

This is still R&D, but maybe...

<aside class="notes">
There is great potential in using the filesystem as a catalogue.

2 features are important:
  * The ability to store key/value /with/ an object (xattrs)
  * The ability to address by ID (rather than filename/path)

OBS are already in production usage for a few years by major (online cloud)
storage service providers. Yet, the "catalogue" world, including the WWW are
still mostly running and "thinking" in hierarchical filesystems. DAMs and MAMs
are currently a middleware layer for trying to link files and "other stuff
related to them" in a way that solely serves: Search and Retrieval.

A basic condition for this to work well is that it is implemented using open
and interoperable standards.

Then, any metadata, any relationship - and additional description or history
that would be assigned to a data-file over its lifecycle would simply
accumulate as part of its object-record.
On filesystem-level.

The default file manager would function as a very basic asset-management system.
It already does so, but in a crude, not-so-interoperable way. And the metadata fields available are currently very file-format related, since often stored inside the file itself.

If moving the paradigm from "metadata in a file", plus the "rest in a separate,
decoupled database" to a "no metadata inside the file, since the file is now an
object, and that object can have certain basic metadata fields by its new
"nature":

  1. objects can be file-data or metadata-only.
  2. +keywords / tags
  3. +key = value pairs (as much as your hardware can handle)
  4. +relationships between objects (as many as your hardware can handle)
  5. relationships are themselves just regular "objects"

This is still ongoing R&D.
</aside>

