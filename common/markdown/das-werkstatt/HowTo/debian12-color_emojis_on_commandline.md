# HowTo enable proper display of colored emojis on the commandline

This article applies to Debian 12 (bookworm).

> **NOTE:**  
> I like local input/formatting localization but /NOT/ translated messages.
> Therefore, the following config will setup your locales with regional
> localization, but NOT translating any output from programs :smile:


By default, on a minimal headless (=commandline/shell only) installation, the emojis are displayed as weird string sequences like this:

`�~X~A�~O = ☁️`

The reason is that the default locale/language is set to "LANG=C" in `/etc/default/locale`.

To fix this, you simply need to set the default language/locale settings to something that contains `UTF-8`.


## Enable only the locales you want on your system:

> **NOTE:**  
> The following needs to be done as /root/. Sudo won't suffice, due to
> output-redirect (`>`) being involved.

```
cp -nav /etc/locale.gen /etc/locale.gen.orig        # "-n" : do NOT overwrite existing files.
head -n 4 /etc/locale.gen.orig > /etc/locale.gen    # Copy the header comments from the original file
grep -E '(de_AT|en_US).UTF-8' /etc/locale.gen.orig >> /etc/locale.gen   # Enable only the locales you want on your system
cat /etc/locale.gen                                 # Show the final config file
```


Or slightly more "beautiful", using a shell variable:

```
export LGEN='/etc/locale.gen'                   # Set the config file as variable
echo "locales to be generated are in: $LGEN"    # Show the filename (to be sure)
cp -nav $LGEN $LGEN.orig                        # "-n" : do NOT overwrite existing files.
head -n 4 $LGEN.orig > $LGEN                    # Copy the header comments from the original file
grep -E '(de_AT|en_US).UTF-8' $LGEN.orig >> $LGEN   # Enable only the locales you want on your system
```

I recommend checking the config file we just edited:

```
cat $LGEN                                       # Show the final config file
```

This should give you something like this:

> # This file lists locales that you wish to have built. You can find a list
> # of valid supported locales at /usr/share/i18n/SUPPORTED, and you can add
> # user defined locales to /usr/local/share/i18n/SUPPORTED. If you change
> # this file, you need to rerun locale-gen.
> de_AT.UTF-8 UTF-8
> en_US.UTF-8 UTF-8

If that output is listing the languages/encodings you want, let's generate the locales:

`locale-gen`

Which should print this:

> Generating locales (this might take a while)...
>   de_AT.UTF-8... done
>   en_US.UTF-8... done
> Generation complete.


## Set the environment variables to use those locales

Check the current setting:

`cat /etc/default/locale.orig`

> LANG="C"

As usual - **Make a backup** before editing config files:

`cp -nav /etc/default/locale /etc/default/locale.orig   # This is a backup for the next step later.`


Then edit `/etc/default/locale.orig` to:

```
LANG=en_US.UTF-8
LC_ALL=de_AT.UTF-8
```


## Install color-emoji font

On /your/ Desktop system that runs the terminal and GUI, install a colored
emoji package to render the glyphs correctly.

On Debian it's the following package:

`apt search noto-color emoji`

> fonts-noto-color-emoji/oldstable 2.042-0+deb12u1 all
>   color emoji font from Google



Now after you logout and log-back-in, you should have the proper language/locale settings.

Enjoy!


