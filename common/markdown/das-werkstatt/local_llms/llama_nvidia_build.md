# Installing llama.cpp on Proxmox LXC (Debian 13 Trixie)

2026-07-30

1) Download llama source

git clone https://github.com/ggml-org/llama.cpp


2) Install dependencies


3) Make
cmake -B build -DGGML_CUDA=ON -DGGML_FLASH_ATTN=ON -DBUILD_SHARED_LIBS=OFF


4) Build

cmake --build build --config Release --clean-first --parallel 6

5) Install

```
sudo mkdir /opt/llama.cpp-git
sudo cp -av ../llama.cpp/build/bin/* /opt/llama-cpp.git
sudo ln -s /opt/llama.cpp-git /opt/llama.cpp
```
