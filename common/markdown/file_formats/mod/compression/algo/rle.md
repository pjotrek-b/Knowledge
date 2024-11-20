# Run Length Enoding (RLE)

  * Uncompressed: ```BBBBBBBBGGBBBBBRRRBBBB``` = 19 Bytes
  * Compressed: ```8B2G5B3R4B``` = 10 Byte

<aside class="notes">
This could be seen as "delta coding", since only *changes* between 2 characters
really require space.
</aside>
