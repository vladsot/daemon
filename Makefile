CC=gcc
CFLAGS=-I.

# PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

daemon: daemon.o 
	$(CC) -o daemon daemon.o $(CFLAGS)

daemon.o:
	$(CC) -c -o daemon.o daemon.c $(CFLAGS)

clean:
	rm -rf daemon daemon.o

install: daemon
	install -m 0755 daemon $(PREFIX)/bin
