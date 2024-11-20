
# Machine Readable

<small>
(aka "parsable output formats")
</small>

  * More suited for automated workflows.
  * Can be saved from GUI.
  * But: Usually commandline.


# Machine Readable Output Formats

  * **XML**
  * **JSON**
  * **CSV**
  * EBUCore
  * PBCore
  * MPEG-7
  * FIMS
  * ...


# Report to File

  * Default:  
    `mediainfo myvideo.mkv > myvideo.mkv.mediainfo`

  * XML Format (better):  
    `mediainfo --output=XML myvideo.mkv > myvideo.mkv.xml`


<aside class="notes">
It is good practice to extract and store a report of the metadata that can be
extracted with tools like Mediainfo alongside your files to be preserved.

This allows easy and quick access to their properties, without the necessity to
always retrieve and load the actual media file (=heavier).
</aside>


# Parsing Output

Built-in:  
`mediainfo --Inform="Audio;%Format%" myvideo.mkv`

Using "[xmlstarlet](http://xmlstar.sourceforge.net/doc/UG/xmlstarlet-ug.html)":  
```
xmlstarlet sel -t -m \
  "//_:media/_:track[@type='Audio']" \
  -c . -n \
  myvideo.xml`
```

<aside class="notes">
You can use any programming library or tool written to access/handle XML data.

XMLstarlet is just one tool that is shown here. I've chosen it, because it is
easily available and allows quick integration in shell scripts.
</aside>
