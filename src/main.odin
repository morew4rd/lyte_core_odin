package main

import "../deps/lyte"

import "core:math"
import "core:os"

tick :: proc "c" (p: rawptr, dt: f32, w, h: i32, resized, fs: bool) {
	lyte.cls(0.5, 0.5, 1, 1)
	lyte.set_color(1, 0.7, 0.3, 1)
	lyte.draw_circle(f64(w / 2), f64(h / 2), f64(math.min(w, h) / 2))
}

init :: proc() {
    w: i32 = 800
    h: i32 = 600
    title :: "hello"

   	cfg := lyte.Config {
		args        = lyte.Args{cast(i32)len(os.args), cast(^^u8)&os.args[0]},
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
}

deinit :: proc() {
    lyte.core_image_cleanup()
    lyte.core_audio_cleanup()
    lyte.core_font_cleanup()
    lyte.core_shader_cleanup()
    lyte.core_filesystem_cleanup()
}

main :: proc() {
    init();
    defer deinit();
	lyte.core_start_loop(tick, nil)
}
