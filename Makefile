-default: build-debug

build-debug:
	rm -rf _b
	mkdir _b
	odin build . -debug -out:_b/modin
