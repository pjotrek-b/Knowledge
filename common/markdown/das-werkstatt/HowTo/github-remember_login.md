# HowTo have a persistent/cached login for Github

I use Virtual Machines (VMs) or containers (LXC) a lot as development environments. Some of them are my own, some of them are run by my clients.

Therefore, I don't like to have "my main" SSH keys on those machines.

So I prefer to do the following:

  1. Generate throw-away ssh keys on the VMs
  2. Register those public-keys on Github (or other remote git-development platform)
  3. Use ssh-agent to cache the passphrase for those keys
  4. Create ssh client config for `github` to use right key

I find it easier, more consistent and cleaner than "tokens".


## 1. Generate throw-away ssh keys on the VMs

`ssh-keygen -t ed25519 -f ~/.ssh/my-temp-github-key1 -C "myusernamegit@vm-hostname.github"

It's common practice to use your email address as `-C` (=comment) argument for key, BUT: since your email address would be the same across all keys, it'd be useless for multiple temp-keys.

So I suggest to use /anything/ that helps you remember/identify that key later on.
Github does NOT use that field to identify your account/key.

I prefer a mix of pseudo email, that helps others relate this "to me" - and help me knowing where I've used this key.

Example: `myusernameatgit@vm-hostname.github`


## 2. Register those public-keys on Github

Open user navigation menu (click on your Avatar image in the upper-right corner):

  - **Settings > SSH and GPG keys**

Select "New SSH key", and copy/paste your new **public** key.


## 3. Use ssh-agent to cache the passphrase for those keys

Should work automatically on Debian/Ubuntu.


## 4. Create ssh client config for `github` to use right key

Add a config block to `~/.ssh/config` as alias `github` using the correct IdentityFile:

```
# GitHub ---------------------------                                            
Host github                                                                     
    User git                                                                    
    Hostname github.com                                                         
    IdentityFile ~/.ssh/my-temp-key
```

Here's an example of a `my_project/.git/config`, pointing to the SSH config (and not directly to the `github.com` host):

```
[core]                                                                          
    repositoryformatversion = 0                                                 
    filemode = true                                                             
    bare = false                                                                
    logallrefupdates = true                                                     
[remote "origin"]                                                               
    url = git@github:MYGITHUBUSER/my_project.git
    fetch = +refs/heads/*:refs/remotes/origin/*                                 
[branch "main"]                                                                 
    remote = origin                                                             
    merge = refs/heads/main 
```

NOTE: the remote url says "git@github" (instead of "github.com"):
This only works /if/ the SSH config "github" is working properly, so you won't accidentially connect without a key/config.


Enjoy!
