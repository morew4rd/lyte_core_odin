package main_app

import "../deps/lyte"

import "core:math"
// import "core:os"
// import "core:fmt"


init :: proc() -> bool {
	return true
}

deinit :: proc() {
}

// x := 0

update :: proc() -> bool {
	// fmt.println("helo", x)
	// x += 1

	w: i32
	h: i32
	lyte.get_window_width(&w)
	lyte.get_window_height(&h)
	lyte.cls(0.5, 0.5, 1, 1)
	lyte.set_color(1, 0.7, 0.3, 1)
	lyte.draw_circle(f64(w / 2), f64(h / 2), f64(math.min(w, h) / 2))
	return true
}
