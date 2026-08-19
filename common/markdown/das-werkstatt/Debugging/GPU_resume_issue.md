# GPU not utilized by llama.cpp when resuming from suspend.

## Problem

Running LLMs LXCs in Debian (Trixie, 13) on Proxmox (9.1), the GPUs are not used at all anymore (eg by llama.cpp) after resuming from suspend. It falls back to CPU-only.


## Solution

Thanks to info in the related issue about Ollama:

[Ollama fails to work with CUDA after Linux suspend/resume, unlike other CUDA services (#5464)](https://github.com/ollama/ollama/issues/5464#issuecomment-2605816642)

...which mentions this solution:

> It involves creating a file `/etc/modprobe.d/nvidia-power-management.conf` with following contents:

```
options nvidia NVreg_PreserveVideoMemoryAllocations=1
options nvidia NVreg_TemporaryFilePath=/tmp
```

I've tried this, and it works.

