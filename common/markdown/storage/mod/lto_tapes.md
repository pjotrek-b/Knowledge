# LTO Data Tapes
## (LTO: Linear Tape Open)



# Tape &amp; Drives

![LTO tape with a drive](../../../images/storage/hardware/lto_tape_drive2.png){width=40% style="float:left"}

  * Got both?
  * Got drivers?
  * Got cables?
  * Got tape software?

<aside class="notes">
There's more to say on drive+media storage, but I'll focus on LTO tapes here,
since they become more "important".

What may seem obvious is, that even if a tape may last a very very long time:
Without a proper drive, you're pretty much lost.
you also need the infrastructure (hardware + drivers) which can operate the
drive properly and the software stack to interpret the filesystem, etc on the
tape itself.

With LTO-tapes, you also need to consider which "LTO Generation" (LTO-4, LTO-5,
... LTO-9, etc) drive and tape are, since not all LTO drives may read all LTO
tapes.
</aside>



# LTO Generations

Imagine you find an old LTO tape...

  * Not every drive can read every tape.
  * New LTO generation release: ~every 2-3 years.
  * &lt; LTO-7: Read=2 gen. / Write=1 gen.
  * BUT: LTO-8: Read/write=**1 gen.**!

<span class="fragment">
Oh, and: Which **filesystem** was it written with...?
</span>

<aside class="notes">
LTO improvements include new LTO generations: Higher data density at same form
factor.  This allows the mechanics (of drives and robots) to stay compatible,
with only requiring certain parts to be updated to support a new generation.

The LTO consortium guarantees a certain level of downwards compatibility.
This used to be:

  * Read: 2 generations down
  * Write: 1 generation down

Example: LTO-6 drive should be able to read LTO 6,5,4 - but write only 6 and 5.

With LTO-8, this was reduced to 1 generation backwards compatibility, so an
LTO-8 drive can *not* read LTO-6, only back to LTO-7

New LTO generation release: About every 2-3 years.
This must be considered for migration!

This also means that you might want to keep a few drives of different
generations in your house?
</aside>



