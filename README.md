dmenu2 - dynamic menu extended 2
================================

* dmenu2 is the fork of original dmenu - an efficient dynamic menu for X,
  patched with XFT, quiet, x & y, token, fuzzy matching, follow focus, tab nav,
  filter.

* Added option to set screen on which dmenu apperars, as long as opacity,
  window class and window name.

* Also allows to dim screen with selected color and opacity while dmenu2 is
  running.

* Added underline color and height. (options -uc and -uh)

Requirements
------------

In order to build dmenu2, you need the Xlib header files.

Installation
------------

1.  Edit config.mk to match your local setup:
  -  (dmenu2 is installed into the /usr/local namespace by default)

2.  Afterwards, enter the following command to build and install dmenu2:
  -  (if necessary, as root)
  -  `make clean install`

Running dmenu2
--------------

See the manual page for details.
