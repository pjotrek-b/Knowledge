
# Performance

Often a tradeoff between:

<table>
<tr>
<td>
**Processing power <small>(CPU/RAM)</small>**  
(format/algorithm complexity, smaller files)
</td>

<td>
**I/O bandwidth <small>(disk/network)</small>**  
(data size)
</td>
</tr>
</table>

<aside class="notes">
Better compressed, usually meaning more complex codec - resulting in smaller
files.  These files travel lighter, but require more processing power (CPU/RAM)
to encode/decode.  If these requirements reach the limits of currently available
processing power, realtime issues may occur. This also means: can the daily
workflows be processed in due time?

Oh, btw: Hardware acceleration plays an important role when it comes to codec
performance. However, hardware acceleration is not necessarily available or
implemented for all formats. Usually you will find this for "popular" formats or
ones that are used in professional domains.
</aside>
