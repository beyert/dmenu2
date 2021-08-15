# dmenu2 version
VERSION = 0.2

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}
MANDIR = ${MANPREFIX}/share/man

X11_PREFIX=	${PREFIX}

X11INC = ${X11_PREFIX}/include
X11LIB = ${X11_PREFIX}/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# Xft, comment if you don't want it
XFTINC = -I${PREFIX}/freetype2
XFTLIBS  = -lXft -lXrender -lfreetype -lz -lfontconfig

# includes and libs
INCS = -I${X11INC} ${XFTINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${XFTLIBS}

# flags
CPPFLAGS = -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 \
	-DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = -s ${LIBS}

# compiler and linker
CC = cc
