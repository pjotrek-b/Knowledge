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

