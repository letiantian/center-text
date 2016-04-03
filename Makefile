PREFIX ?= /usr/local/bin

install: center-text.sh
	cp $< $(PREFIX)/center-text
	chmod +x $(PREFIX)/center-text

uninstall:
	rm -f $(PREFIX)/center-text

.PHONY: install uninstall