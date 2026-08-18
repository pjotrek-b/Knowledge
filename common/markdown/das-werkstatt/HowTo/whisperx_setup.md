# Setup of WhisperX on Debian LXC in Proxmox

## Install Conda python environment

(https://www.howtoforge.com/how-to-install-miniconda-on-debian-12/)

I chose to use Miniconda.

https://www.anaconda.com/docs/getting-started/miniconda/install/linux-install

Download and install Miniconda:

```
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3*.sh
./Miniconda3*.sh
```

The installer ends with this:

```
Do you wish to update your shell profile to automatically initialize conda?
This will activate conda on startup and change the command prompt when activated.
If you'd prefer that conda's base environment not be activated on startup,
   run the following command when conda is activated:

conda config --set auto_activate_base false

Note: You can undo this later by running `conda init --reverse $SHELL`
```


## Setup conda for whisperx

`conda create -n whisperx python=3.10`

Activate Conda environment
`conda activate whisperx`


## Install Whisperx

Following instructions on:
https://github.com/m-bain/whisperX


Activate (enter) the Conda environment, and pip-install whisperx:

``` 
conda activate whisperx
pip3 install whisperx
``` 

Takes some time to download packages. Several GBs. I hope I find out where they're cached for followup installations.


Then, call whisperx on a WAV file (I used PCM, 44.1kHz, 16bits, LE).

`(whisperx) whisperx --language de test.wav`

It will now download the LLMs needed for that language (~800+ MB, in my case).
I run it with "--model large-v2", so it pre-downloads the larger LLM (~2.5 GB):

`(whisperx) whisperx --model large-v2 --language de test.wav`

Outputs a bunch of transcript format options:

  * srt
  * vtt
  * json
  * ...
  * txt

Amazing.
