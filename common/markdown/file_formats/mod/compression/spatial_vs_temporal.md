# Compression: Spatial and Temporal

A/V allows to apply compression in 2 ways:

  * **Spatial:**
    Inside an image
  * **Temporal:**
    Between images

<aside class="notes">
The 1st one doesn't differ much from "image only" compression algorithms (JPEG,
RLE, etc).

Temporal compression can be seen as "delta coding", similar to RLE:
You only write down what *changes* between 2 images/samples, as you would only
write down what changes between 2 characters in text compression.
</aside>


# Spatial compression: Examples

  * **Audio:**
    [Differential pulse-code modulation (DPCM)](https://en.wikipedia.org/wiki/Dpcm)
  * **Video:**
    [GOP](https://en.wikipedia.org/wiki/Group_of_pictures),
    [Motion estimation](https://en.wikipedia.org/wiki/Motion_estimation)


