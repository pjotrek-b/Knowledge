# Storage: Does it scale?

<table>
<tr>
<td>
![Backblaze data center](../../../images/storage/cloud/backblaze-cloud-storage-datacenter-photo.jpg){width=600px}
</td>

<td>
![Tape library (robot)](../../../images/storage/hardware/tape_library_robot.jpg){width=600px}
</td>
</tr>
</table>


<aside class="notes">
The image shows one row of Backblaze storage pods in a computing center.
This is just to give you an idea that:

  * The Cloud literally is just a bunch of computers (and storage media inside
    them).
  * Large volumes of data need large volumes of space.
    And electricity, knowhow and spare parts and staff.
  * However, the underlying mechanisms and applications are designed to scale.
</aside>



# Does it scale?

  * What if you run out of diskspace?
  * Need to copy/move everything?
  * Or can you simply add "more space"?
  * What about your file/folder positions?
  * How to know if everything is still "there" and intact?


<aside class="notes">
In the past with RAID, it was very common that enlarging the storage space
meant: get a bigger RAID with bigger disks, then copy everything over and
switch to the new storage.

With data sizes currently common for professional AV content, this approach is
a very delicate one that puts your data in quite some danger, as the time where
data is the most vulnerable is when it's being moved.
</aside>



# Software Defined Storage (SDS)
## More "Classical", yet supersize-able.

![Example screenshot (Linbit SDS)](../../../images/storage/cloud/LinbitSDS_Screenshot.png)


<aside class="notes">
Quote from [Wikipedia "Software-defined storage"](https://en.wikipedia.org/wiki/Software-defined_storage):

<small>
"Software-defined storage typically includes a form of storage virtualization to
separate the storage hardware from the software that manages it.

The software enabling an SDS may also provide policy management for features
such as data deduplication, replication, thin provisioning, snapshots and
backup."
</small>
</aside>



# Again: Layers.

![Example of abstraction layers](../../../images/storage/cloud/DRBD-Function-Diagram2.png){width=500px .plain}

<aside class="notes">
Quote from [Linbit Website](https://linbit.com/software-defined-storage/):

> "Since the software simply presents a block device, users do not need to use
> complex, shared file systems. Because we can use a single node with a filesystem
> on top of a block device, backing disk failure is transparent to the end user."

Large storage that provides flexibility/scalability, the required features
(distribution, replication, backup, etc, etc) - and transparency for the
applications accessing the files means stacking up more layers.

Even if it ain't rocket science, it still is far from trivial (especially
setting it up, maintaining and and debugging it).
</aside>


