# Object storage

Beyond classical, hierarchical filesystems



# Object storage

![](../../../images/storage/types/objectStorageOracle.jpg){width=90%}



# Object storage

  * Files become "objects".
  * There are no (actual) folders. <small>(Foldername = Plain Metadata)</small>
  * There's just an identifier.
  * Arbitrary metadata may be assigned to each "object".
  * Scales infinitely <small>(theoretically)</small>
  * Clusters of block storages with clever abstraction layers.
  * Quite a complex construct of APIs, layers and components. Fascinating.

<aside class="notes">
You may have been using object based storage on Google Drive or Amazon S3.

Pretty cool, but it handles very differently from any regular file/folder based
storage!  Please do your homework before deploying this.

It is still pretty new and if done wrong, it can cause more troubles/effort
than a regular, hierarchical FS storage.

What is often left out by marketing:

  * Underneith, it is still using block storage.

  * Just with clever abstraction layer(s).

  * Important: Your toolchain needs to be object-storage-aware!  Regular,
  well-known tools cannot easily access object files as it used to be.

  * I mention it here, because if done right, it scales.

I'm pretty sure, this is the future - and (at least large scale) storage will
be going from classical (filesystem-based) to this (=object based) way.
</aside>



# Object Storage = The Future?

![](../../../images/misc/doc_brown_painting.jpg){width=20% style="float:right"}

Object based storage may very likely replace hierarchical filesystems
<small>(but things need to be rewritten/adapted to properly support it.</small>

**It's not yet (really) plug-compatible with existing programs.**




# Object Storage = MAM?

  * The object filesystem **is an actual catalogue**
  * If implemented well, the storage itself may be a future DAM/MAM.
  * Links/relationships between objects = 🤯🤠🥳
  * Combined with LoD, MD Standards & APIs = Wikidata for your files.
  * No more distance between file and its catalogue entry.

Just an idea so far, but maybe...?

<aside class="notes">
There is great potential in Object Based Storage.

OBS are already in production usage for a few years by major (online cloud)
storage service providers. Yet, the "catalogue" world, including the WWW are
still mostly running and "thinking" in hierarchical filesystems. DAMs and MAMs
are currently a middleware layer for trying to link files and "other stuff
related to them" in a way that solely serves: Search and Retrieval.

A basic condition for this to work well is that it is implemented using open
and interoperable standards.

Then, any metadata, any relationship - and additional description or history that would be assigned to a data-file over its lifecycle would simply accumulate as part of its object-record.
On filesystem-level.

The default file manager would function as a very basic asset-management system.
It already does so, but in a crude, not-so-interoperable way. And the metadata fields available are currently very file-format related, since often stored inside the file itself.

If moving the paradigm from "metadata in a file", plus the "rest in a separate,
decoupled database" to a "no metadata inside the file, since the file is now an
object, and that object can have certain basic metadata fields by its new
"nature":

  1. objects can be file-data or metadata-only.
  2. +keywords / tags
  3. +name = value pairs (as much as your hardware can handle)
  4. +relationships between objects (as many as your hardware can handle)
  5. relationships are themselves just regular "objects"

This is currently just an idea...
</aside>



