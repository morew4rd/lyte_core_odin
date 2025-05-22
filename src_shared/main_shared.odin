package main_shared

import "../deps/lyte"

import "base:runtime"
// import "core:math"
import "base:builtin"
// import "core:fmt"
import "core:os"
UpdateFunc :: proc() -> bool

update_func: UpdateFunc

tick :: proc "c" (p: rawptr, dt: f32, w, h: i32, resized, fs: bool) {
	context = runtime.default_context()

	lyte.cls(1, 0, 0, 0)
	if update_func != nil {
		// fmt.println("shared_update tick")
		should_run := update_func()
		if !should_run do lyte.quit()
	}
}

update :: proc() -> bool {

	return true
}

init :: proc() -> bool {
	w: i32 = 800
	h: i32 = 600
	title :: "hello"

	_ = os.args

	cfg := lyte.Config {
		args        = lyte.Args {
			0,
			nil,
		} when ODIN_ARCH == .wasm32 || ODIN_ARCH == .wasm64p32 else lyte.Args{cast(i32)len(os.args), cast(^^u8)&os.args[0]},
		exe_name    = "meh",
		filtermode  = lyte.FilterMode.LINEAR,
		blendmode   = lyte.BlendMode.BLEND,
		window_size = lyte.Size{w, h},
	}
	lyte.core_state_init(cfg)
	lyte.core_filesystem_init()
	lyte.core_image_init()
	lyte.core_audio_init()
	lyte.core_font_init()
	lyte.core_shader_init()
	lyte.core_window_init()
	lyte.set_window_title(title)
	return true
}

deinit :: proc() {
	lyte.core_image_cleanup()
	lyte.core_audio_cleanup()
	lyte.core_font_cleanup()
	lyte.core_shader_cleanup()
	lyte.core_filesystem_cleanup()
}
