# dmenu2 - dynamic menu 2
# See COPYRIGHT file for copyright and license details.

include config.mk

SRC = dmenu2.c draw.c stest2.c
OBJ = ${SRC:.c=.o}

all: options dmenu2 stest2

options:
	@echo dmenu2 build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC -c $<
	@${CC} -c $< ${CFLAGS}

${OBJ}: config.mk draw.h

dmenu2: dmenu2.o draw.o
	@echo CC -o $@
	@${CC} -o $@ dmenu2.o draw.o ${LDFLAGS}

stest2: stest2.o
	@echo CC -o $@
	@${CC} -o $@ stest2.o ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f dmenu2 stest2 ${OBJ} dmenu2-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p dmenu2-${VERSION}
	@cp COPYRIGHT Makefile README config.mk dmenu2.1 draw.h dmenu2_run \
		stest2.1 ${SRC} dmenu2-${VERSION}
	@tar -cf dmenu2-${VERSION}.tar dmenu2-${VERSION}
	@gzip dmenu2-${VERSION}.tar
	@rm -rf dmenu2-${VERSION}

install: all
	@echo installing executables to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f dmenu2 ${DESTDIR}${PREFIX}/bin/dmenu2
	@cp -f dmenu2_run ${DESTDIR}${PREFIX}/bin/dmenu2_run
	@cp -f dmenu2_path ${DESTDIR}${PREFIX}/bin/dmenu2_path
	@cp -f stest2 ${DESTDIR}${PREFIX}/bin/stest2
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu2
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu2_run
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu2_path
	@chmod 755 ${DESTDIR}${PREFIX}/bin/stest2
	@echo installing manual pages to ${DESTDIR}${MANDIR}/man1
	@mkdir -p ${DESTDIR}${MANDIR}/man1
	@sed "s/VERSION/${VERSION}/g" < dmenu2.1 > \
		${DESTDIR}${MANDIR}/man1/dmenu2.1
	@sed "s/VERSION/${VERSION}/g" < stest2.1 > \
		${DESTDIR}${MANDIR}/man1/stest2.1
	@chmod 644 ${DESTDIR}${MANDIR}/man1/dmenu2.1
	@chmod 644 ${DESTDIR}${MANDIR}/man1/stest2.1

uninstall:
	@echo removing executables from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu2
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu2_run
	@rm -f ${DESTDIR}${PREFIX}/bin/stest2
	@echo removing manual page from ${DESTDIR}${MANDIR}/man1
	@rm -f ${DESTDIR}${MANDIR}/man1/dmenu2.1
	@rm -f ${DESTDIR}${MANDIR}/man1/stest2.1

.PHONY: all options clean dist install uninstall
