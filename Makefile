#---------------------------------------------------------------
# Project         : Linux-Mandrake
# Module          : spec-helper
# File            : Makefile
# Version         : $Id$
# Author          : Frederic Lepied
# Created On      : Fri Feb 18 08:11:21 2000
#---------------------------------------------------------------

VERSION=0.2
FILES= spec-helper clean_files compress_files strip_files
DISTFILES= Makefile ChangeLog Howto-spec-helper $(FILES)
NAME=spec-helper
DIST=$(NAME)-$(VERSION)

all:
	@echo "use make install or make dist"

dist:
	rm -f $(NAME)-$(VERSION).tar.bz2
	rm -rf $(DIST)
	mkdir $(DIST)
	ln $(DISTFILES) $(DIST)
	tar cvf $(NAME)-$(VERSION).tar $(DIST)
	bzip2 -9vf $(NAME)-$(VERSION).tar
	rm -rf $(DIST)

install:
	install -d -m 755 $(DESTDIR)/usr/share/spec-helper
	install -m 755 $(FILES) $(DESTDIR)/usr/share/spec-helper

dis:
	rm -rf $(NAME)-$(VERSION) ../$(NAME)-$(VERSION).tar*
	mkdir -p $(NAME)-$(VERSION)
	ln $(DISTFILES) $(NAME)-$(VERSION)
	tar cvf ../$(NAME)-$(VERSION).tar $(NAME)-$(VERSION)
	bzip2 -9vf ../$(NAME)-$(VERSION).tar
	rm -rf $(NAME)-$(VERSION)

rpm: ../$(NAME)-$(VERSION).tar.bz2
	test -d $(RPM)/SOURCES && test -d $(RPM)/
	cp -f ../$(NAME)-$(VERSION).tar.bz2 $(RPM)/SOURCES
	-rpm -ba --clean --rmsource $(NAME).spec
	rm -f $(NAME)-$(VERSION).tar.bz2

# Local variables:
# mode: makefile
# End:
#
# Makefile ends here