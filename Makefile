 -default: run

build-debug:
	rm -rf _b
	mkdir _b
	odin build . -debug -out:_b/modin -extra-linker-flags:"-lbz2 -lbrotlidec"


run: build-debug
	# odin run .
	_b/modin
