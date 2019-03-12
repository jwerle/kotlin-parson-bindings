CINTEROP ?= cinterop
CONFIGURE ?= ./configure

build: deps/parson/parson.o
build: libparson.a
build: parson.def
build: parson.klib

deps/parson/parson.o: deps/parson/parson.c
	$(CC) -c $< -o $@

libparson.a: deps/parson/parson.o
	$(AR) cr $@ $^

parson.def: parson.def.in
	$(CONFIGURE)

parson.klib: libparson.a
parson.klib: parson.def
	$(CINTEROP) -pkg parson -def $< -o $@

clean:
	rm -f *.a *.klib deps/*/*.o *.def *.kexe
	rm -rf *-build/
