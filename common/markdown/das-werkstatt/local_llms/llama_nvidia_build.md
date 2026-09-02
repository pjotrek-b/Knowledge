# Installing llama.cpp on Proxmox LXC (Debian 13 Trixie)

2026-07-30

## 1 Download llama source

`git clone https://github.com/ggml-org/llama.cpp`


## 2 Install dependencies


## 3 Make

`cmake -B build -DGGML_CUDA=ON -DGGML_FLASH_ATTN=ON`

This one produces way larger binaries, but they work standalone (without shared
libraries):

`cmake -B build -DGGML_CUDA=ON -DGGML_FLASH_ATTN=ON -DBUILD_SHARED_LIBS=OFF`

More infos, see:
https://ggml-org-llama-cpp.mintlify.app/development/building


## 4 Build

`cmake --build build --config Release --clean-first --parallel 6`


## 5 Install

```
sudo mkdir /opt/llama.cpp-git
sudo cp -av ../llama.cpp/build/bin/* /opt/llama-cpp.git
sudo ln -s /opt/llama.cpp-git /opt/llama.cpp
```


# `Models.ini` to select models on the fly

Configure the following file `/etc/llama.cpp/models.ini` to load/unload multiple models on the fly in a running llama-server session.

Then point llama-server to use the models.ini:
`/opt/llama.cpp/llama-server --models-preset /etc/llama.cpp/models.ini`

```
# This block applies the defaults to other blocks:
[*]
threads=6
no-mmap=true
flash-attn=on
jinja=true
offline=true
reasoning=off
main-gpu=1


[qwen35-mmi]
# Uses QWEN3_35MM_I: Q4_K_XL-MTP, ctx 131072, image mmproj, n-cpu-moe 8, ub 512, q4_0 kv cache, flash-attn, spec-mtp, temp 0.6, top-p 0.9, top-k 20
# WORKS!
cache-type-k=q4_0
cache-type-v=q4_0
ctx-size=131072
flash-attn=on
mmproj=/mnt/iamai/models/huggingface/Unsloth.Qwen3.6-35B/A3B/MTP/mmproj/mmproj-F16.gguf
model=/mnt/iamai/models/huggingface/Unsloth.Qwen3.6-35B/A3B/MTP/Qwen3.6-35B-A3B-UD-Q4_K_XL-MTP.gguf
n-cpu-moe=8
n-gpu-layers=99
no-mmap=true
parallel=3
spec-draft-n-max=2
spec-type=draft-mtp
temp=0.6
top-k=20
top-p=0.9
ubatch-size=512


[qwen27-mmi]
cache-type-k=q4_0
cache-type-v=q4_0
ctx-size=128000
image-min-tokens=1024
mmproj=/mnt/iamai/models/huggingface/Unsloth.Qwen3.6-27B/mmproj/mmproj_image-Qwen_Qwen3.6-27B-f16.gguf
model=/mnt/iamai/models/huggingface/Unsloth.Qwen3.6-27B/Qwen3.6-27B-Q4_K_M.gguf
n-cpu-moe=42
no-mmap=true


[phi-q4]
model=/mnt/iamai/models/huggingface/Phi-4-mini/Phi-4-mini-instruct-Q4_K_M.gguf
```



# Systemd configuration

Save this to `/etc/systemd/system/llama.service`:

```
[Unit]
Description=llama.cpp Server
After=network.target

[Service]
Type=simple
User=arkthis
WorkingDirectory=/opt/llama.cpp
ExecStart=/opt/llama.cpp/llama-server --models-preset /etc/llama.cpp/models.ini
Restart=no
Environment="PATH=/usr/bin:/usr/local/bin" LLAMA_CACHE="/mnt/iamai/models/huggingface/hub" TERM="tmux-256color"

[Install]
WantedBy=multi-user.target
```


## Override config for IP/Port, etc

Here's the contents of systemd override file:
(Create with `systemctl edit llama`)

```
[Service]
Environment="LLAMA_ARG_HOST=0.0.0.0" "LLAMA_ARG_PORT=8081"

# Enable this to force a single GPU (eg for performance benchmark comparison):
#Environment="CUDA_VISIBLE_DEVICES=0"
```



# Additional remarks

## Unsloth on Qwen3.8-next

Here's the build instructions from [unsloth (for Qwen3.8-next)](https://unsloth.ai/docs/models/qwen3.8-next)

```
apt-get update

apt-get install pciutils build-essential cmake curl libcurl4-openssl-dev -y
git clone https://github.com/ggml-org/llama.cpp

cmake llama.cpp -B llama.cpp/build \
    -DBUILD_SHARED_LIBS=OFF -DGGML_CUDA=ON

cmake --build llama.cpp/build --config Release -j --clean-first --target llama-cli llama-mtmd-cli llama-server llama-gguf-split

cp llama.cpp/build/bin/llama-* llama.cpp
```


## Githabidere on Qwen3.6-35B-A3B-MTP

From (https://github.com/githabideri/llmlab/blob/main/reports/2026-08-27-qwen3.6-35b-a3b-dual-3060-optimization.md)

```
cmake -DCMAKE_BUILD_TYPE=Release \
      -DGGML_CUDA=ON \
      -DCMAKE_CUDA_ARCHITECTURES=86 \
      -DGGML_CUDA_FA_ALL_QUANTS=ON
```

Combined to:

In the folder of llama.cpp (git checkout path):

```
cmake -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CUDA_ARCHITECTURES=86 \
  -DGGML_CUDA=ON \
  -DGGML_CUDA_FA_ALL_QUANTS=ON \
  -DGGML_FLASH_ATTN=ON

cmake --build build --config Release --clean-first --parallel 6 \
  --target llama-cli llama-mtmd-cli llama-server llama-gguf-split
```
