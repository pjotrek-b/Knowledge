
# Digital Video Trinity

![](../../../images/tech-video/trinity/video_trinity2.png){.plain}

<aside class="notes">
The uncomfortable truth. It's more than "1 format" to choose/consider for AV.

The container format is the one you see in the filename as suffix:
mov, mkv, mxf, avi, flv, 3gp, wav, etc.


A/V media files:
"The" format of video files usually consists of 3 different formats:

  * Container
  * Video codec
  * Audio codec

Optional:

Embedded metadata of all kinds:

  * Descriptive
  * Technical
  * non time-based / time-based

Additional data streams:
(usually "time-based")

  * subtitles
  * timecode
  * crazy special feature xy
  * etc, etc, etc...


</aside>



# What's a Container / Wrapper?

> "A container format [...] is a file format that allows multiple data streams
> to be embedded into a single file.
>
> Usually along with metadata for identifying and further detailing those
> streams."

<small>
Source: [Wikipedia: Container format (computing)](https://en.wikipedia.org/wiki/Container_format_(computing))
</small>



# What's a Container?

<table>
<tr>
<td>
**Think of a regular paper folder...**

  * It's a wrapper around content.
  * Contains Metadata.
  * Structures the content streams.
</td>

<td>
![Videofile paper mockup](../../../images/tech-video/trinity/pb-video_container_mockup.jpg){width=500px}
</td>
</tr>
</table>

<aside class="notes">
Metadata:
  * Index (which streams are contained, etc)
  * Descriptive MD (title, language, etc)
  * as well as technical MD (fps, aspect ratio, color handling, etc)
  * NOTE: Some technical MD may be stored in the container *and* the codec/stream.
    This may be a blessing and a curse... Example: Aspect ratio or fps.
</aside>





# What's a Codec?

> "A codec is a device or computer program which encodes or decodes
> a data stream or signal."

<small>Source: [Wikipedia: Codec](https://en.wikipedia.org/wiki/Codec)</small>



# What's a Codec?

**Think of a human language...**

  * It's coded information.
  * There may be dialects.
  * Different people may  
    "speak / understand" differently.

