 -default: run-desktop

build-desktop-debug:
	npx rimraf _b
	mkdir _b
	odin build src_desktop -debug -out:_b/modin -extra-linker-flags:"-lbz2 -lbrotlidec"


run-desktop: build-desktop-debug
	# odin run .
	_b/modin


build-web:
	npx rimraf _bw
	mkdir _bw
	odin build src_web -target:js_wasm32 -build-mode:obj  -define:LYTE_CORE_WASM_LIB=env.o  -vet -strict-style -out:_bw/app

	cp deps/odin_web/odin.js _bw


	# index_template.html contains the javascript code that calls the procedures in
	# source/main_web/main_web.odin
	# flags="-sUSE_GLFW=3  sMAX_WEBGL_VERSION=2 -s USE_WEBGL2=1 -s FULL_ES3=1 -sWASM_BIGINT -sWARN_ON_UNDEFINED_SYMBOLS=0 -sASSERTIONS -s EXPORTED_RUNTIME_METHODS=['ccall','cwrap','FS'] --shell-file source/main_web/index_template.html --preload-file assets"

	# For debugging: Add `-g` to `emcc` (gives better error callstack in chrome)
	#

	#Lyte's config:       set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-s TOTAL_STACK=64MB -s INITIAL_MEMORY=256MB -s ALLOW_MEMORY_GROWTH=1 -s USE_GLFW=3 -s USE_WEBGL2=1 -s FULL_ES3=1 -s EXPORTED_RUNTIME_METHODS=['ccall','cwrap','FS'] -s EXPORTED_FUNCTIONS=['_main','_k_fs_add_droppedfile'] ")

	emcc -o _bw/index.html \
	    _bw/app.wasm.o deps/lyte/lyte_web/liblyte_core.a deps/lyte/lyte_web/libfreetype.a deps/lyte/lyte_web/libphysfs.a deps/lyte/lyte_web/libraudio.a \
		-s TOTAL_STACK=64MB -s INITIAL_MEMORY=256MB -s ALLOW_MEMORY_GROWTH=1   -s EXPORTED_RUNTIME_METHODS=['ccall','cwrap','FS','HEAPF32']  -s EXPORTED_FUNCTIONS=['_main_update'] \
		-sUSE_GLFW=3 -s USE_WEBGL2=1 -s FULL_ES3=1  -sWASM_BIGINT -sWARN_ON_UNDEFINED_SYMBOLS=0 -sASSERTIONS --shell-file src_web/index_template.html

run-web: build-web
	npx http-server _bw
