# HowTo generate source code documentation for Omeka S.

Using [doxygen](https://www.doxygen.nl/manual/doxygen_usage.html) to parse the source and create HTML documentation of all classes and their properties, methods and inheritance.

The commands/instructions provided here should work on most GNU/Linux based operating systems. The syntax and tools here runs on Debian/Ubuntu flavors.

1. Install doxygen and graphviz
2. Download Omeka S source.
2. Generate config file.
3. Edit config file:
  - project name
  - output folder
  - source folder
  - enable recursive
4. Create output folder
5. Run doxygen


# 1. Install doxygen and graphviz

Run the following in a shell:

`apt install doxygen graphviz`



# 2. Download Omeka S source.

The nice thing about php and python is that it's most of the time released not as binary executables, but in their source code form.

So pulling a regular FOSS release, written in such languages includes their source code by nature:

Download from: `https://github.com/omeka/omeka-s/releases`

Or:

`git clone https://github.com/omeka/omeka-s.git`


# 3. Generate config file.

Go to Omeka folder:

`cd $HOME/Download/omeka-s.git/`

`doxygen -g doxygen-omeka.cfg`

This will create the file `doxygen-omeka.cfg` and provide all key/value options with sane defaults.


# 4. Edit config file

You only need to change the following properties in that doxygen-config file:

```
# Just a human readable label for what this doc is about:
PROJECT_NAME           = "Omeka S (ZIP)"
# Find the sourcecode here:
INPUT                  = application/src
# ...and also search subfolders there:
RECURSIVE              = YES
# Put html/latex output in the following folder:
OUTPUT_DIRECTORY       = doc/
```

# 5. Create output folder

`mkdir ../omeka-s.git/doc`


# 6. Run doxygen

`doxygen doxygen_omeka.cfg`

Enjoy. 🌻️- 😎️ -🌻️


