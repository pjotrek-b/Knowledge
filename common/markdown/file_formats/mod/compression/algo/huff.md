# Huffman Compression


# Huffman Tree

![](../../../images/data/compression/huffman_tree1.png){ width=80% }


# Huffman Code

<small>

| Letter  | Freq  | Code   | Bits  |
| ------- | ----- | ------ | ----- |
| E       | 120   | 0      | 1     |
| D       | 42    | 101    | 3     |
| L       | 42    | 110    | 3     |
| U       | 37    | 100    | 3     |
| C       | 32    | 1110   | 4     |
| M       | 24    | 11111  | 5     |
| K       | 7     | 111101 | 6     |
| Z       | 2     | 111100 | 6     |

</small>

<aside class="notes">
Interesting: For very infrequent characters, the Huffman coding might even take
more bits than an uncompressed representation.

This is especially problematic for noise signals, because:
noise = chaos = no frequency pattern.
</aside>
