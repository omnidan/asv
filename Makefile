
M_PREFIX ?= /usr/local

nothing:

install: bin/asv
		cp $< $(M_PREFIX)/$<

uninstall:
		rm -f $(M_PREFIX)/bin/asv

.PHONY: install uninstall nothing
