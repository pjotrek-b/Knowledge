<!--
Failsafe options/mechanisms for catalogues/DAMs
-->

# Files intact, but MAM gone?

![Needle in a haystack?](../../../images/misc/needle-in-haystack.jpg){.r-stretch}



# Store identifying metadata

![](../../../images/tools/mediainfo/mediainfo-techmd_overview2.png){.r-stretch}

<aside class="notes">
The following may improve finding and/or re-organizing your files independent
of the asset management system that has been used to allocate them before:

Store some identifying metadata in+next to your files:

  * Minimalistic inside the file:
    Textual data that is most likely *not* to change over the lifetime of
    the file.
    Good practice: title, identifier, institution name, digitization date

  * More metadata next to the content files (sidecar).
    * Store images as images.
    * Store textual data as structured text (XML is text).
      Makes it easier to modify, augment and migrate this data, but leave the large files in place.
  * As simple as possible, as complicated as necessary.
</aside>



# Failsafe options

  * Backup database.
  * Backup storage.
  * Setup MAM as [Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine).
  * Test export options.
  * Documented export data format.
  * Documentation &amp; Source Code.

