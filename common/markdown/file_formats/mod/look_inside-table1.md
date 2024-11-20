# Characteristics / Properties

|               | File 1        | File 2        | File 3     |
| ----          | -----         | -----         | -----      |
| **Container**     | <red>MOV</red>           | <red>MOV</red>           | <red>MOV</red>        |
| **Videocodec**    | <blue>UYVY</blue>          | <blue>H.264</blue>         | <blue>XviD</blue>       |
| **Resolution**    | 720 x 576px   | 1920 x 1080   | 640 x 480  | 
| **FPS**           | 25            | 24            | 30000/1001 |
| -        | | | |
| **Audiocodec**    | <green>PCM</green>           | <green>AAC</green>           | <green>MP3</green>        |
| **Samplerate**    | 48 kHz        | 48 kHz        | 44.1 kHz   |
| **Channels**      | Stereo        | Surround 5.1  | Mono       |


<aside class="notes">
This is just a random example to show that from the "outside" (=file explorer) you would only see that all files are ".mov" - whereas their actual audio/video codecs, as well as their technical properties are completely different. It therefore always makes sense to use proper tools to "look inside" (MediaInfo, etc).

As you can see, just declaring the file-ending ".mov" does not really tell us much about the actual video/audio formats/encodings being used.
</aside>
