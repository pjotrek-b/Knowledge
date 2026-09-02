# Error while installing SwarmUI

I've installed "nvidia-driver" package (because I looove Debian stable and apt comfort for drivers and kernels too).

nvidia-smi says:

> Driver Version: 550.163.01     CUDA Version: 12.4 

But pytorch pulled from SwarmUI, throws the following error:

> [ComfyUI-0/STDERR] RuntimeError: The NVIDIA driver on your system is too old (found version 12040). Please update your GPU driver by downloading and installing a new version from the URL: http://www.nvidia.com/Download/index.aspx

I'll go with this part, I guess:

> "Alternatively, go to: https://pytorch.org to install a PyTorch version that has been compiled with your version of the CUDA driver."


However, it seems  the URL in the error message leads to 404 (from Austria), so here's the download link:

[Linux x64 (AMD64/EM64T) Display Driver 595.84 | Linux 64-bit](https://www.nvidia.com/de-de/drivers/details/272964/)



## Full, uncut output of SwarmUI installer:

```
[ComfyUI-0/STDERR] Traceback (most recent call last):
[ComfyUI-0/STDERR]   File "/home/arkthis/install/SwarmUI/dlbackend/ComfyUI/main.py", line 227, in <module>
[ComfyUI-0/STDERR]     import execution
[ComfyUI-0/STDERR]   File "/home/arkthis/install/SwarmUI/dlbackend/ComfyUI/execution.py", line 18, in <module>
[ComfyUI-0/STDERR]     import comfy.model_management
[ComfyUI-0/STDERR]   File "/home/arkthis/install/SwarmUI/dlbackend/ComfyUI/comfy/model_management.py", line 362, in <module>
[ComfyUI-0/STDERR]     total_vram = get_total_memory(get_torch_device()) / (1024 * 1024)
[ComfyUI-0/STDERR]                                   ^^^^^^^^^^^^^^^^^^
[ComfyUI-0/STDERR]   File "/home/arkthis/install/SwarmUI/dlbackend/ComfyUI/comfy/model_management.py", line 211, in get_torch_device
[ComfyUI-0/STDERR]     return torch.device(torch.cuda.current_device())
[ComfyUI-0/STDERR]                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
[ComfyUI-0/STDERR]   File "/home/arkthis/install/SwarmUI/dlbackend/ComfyUI/venv/lib/python3.11/site-packages/torch/cuda/__init__.py", line 1167, in current_device
[ComfyUI-0/STDERR]     _lazy_init()
[ComfyUI-0/STDERR]   File "/home/arkthis/install/SwarmUI/dlbackend/ComfyUI/venv/lib/python3.11/site-packages/torch/cuda/__init__.py", line 491, in _lazy_init
[ComfyUI-0/STDERR]     torch._C._cuda_init()
[ComfyUI-0/STDERR] RuntimeError: The NVIDIA driver on your system is too old (found version 12040). Please update your GPU driver by downloading and installing a new version from the URL: http://www.nvidia.com/Download/index.aspx Alternatively, go to: https://pytorch.org to install a PyTorch version that has been compiled with your version of the CUDA driver.

00:06:05.226 [Error] Self-Start ComfyUI-0 on port 7822 failed. AutoRestart ignored as this was an initial launch failure.
```
