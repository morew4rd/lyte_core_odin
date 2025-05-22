package main_desktop

import "../deps/lyte"

import "core:log"
import "core:os"
import "core:path/filepath"

import app "../src_app"
import shared "../src_shared"

main :: proc() {
	exe_path := os.args[0]
	exe_dir := filepath.dir(string(exe_path), context.temp_allocator)
	os.set_current_directory(exe_dir)
	context.logger = log.create_console_logger()

	shared.init()
	defer shared.deinit()
	shared.update_func = app.update
	app.init()
	defer app.deinit()


	lyte.core_start_loop(shared.tick, nil)
}
