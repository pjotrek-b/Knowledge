# On Proxmox 9.1, nvidia driver version 595

2026-07-10

Notes on following the following tutorial (big thanks!):
https://digitalspaceport.com/how-to-setup-an-ai-server-homelab-beginners-guides-ollama-and-openwebui-on-proxmox-lxc/


# Install prerequisites

`apt install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa-dev libfreeimage-dev libglfw3-dev wget htop btop nvtop nano glances git pciutils cmake curl libcurl4-openssl-dev`


```
wget https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/cuda-keyring_1.1-1_all.deb

dpkg -i cuda-keyring_1.1-1_all.deb

apt update && apt -y install cuda-toolkit-13-2

cp -av .bashrc .bashrc.bak
```

Add this at the bottom of  ~/.bashrc:

`export PATH=/usr/local/cuda-13.2/bin${PATH:+:${PATH}}`
