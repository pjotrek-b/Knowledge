
# Risks to format longevity

  * Data errors
  * Obsolescence
  * Vendor lock-in
  * Interoperability/complexity issues
  * Quality degradation

Countermeasures?

<aside class="notes">
  * Data errors:
    Files are corrupt.
    These errors may include filenames or filesystem tech-MD.

  * Obsolescence:
    Not supported anymore by accessible tools.
    This is neither God-given, nor irreversible, unless it's a black-box format.
    Format obsolescense/support is a human-made decision.
    Documentation/schematics are an important game changer.

  * Vendor lock-in:
    For long-term preservation, vendor- and technology-neutrality is a must:
    They will come and go, and with lock-in situations Eternal Migration is
    hindered or even impossible.
    Format normalization helps here.

  * Interoperability issues:
    If a format is read and written differently by different applications, it
    might "morph". This morphed version might work fine with the tools used in a
    certain environment, but might be completely broken if read/written by
    another tool that misunderstands the "dialect".

    A format offering more features, can be considered more "complex".
    Whereas a format offering less features is considered "simpler".
    Simpler (and more popular) formats are usually less susceptible to
    interoperability issues, than complex (and/or less popular ones)

  * Quality degradation:
    Avoid unncessary copy/encoding generation losses, or property conversion.
    This may include, avoiding additional lossy encoding steps, resizing the
    image, resampling audio, etc.
</aside>
