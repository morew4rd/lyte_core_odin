package main

import "deps/lyte"
import rl "vendor:raylib"

C_BG :: rl.Color{255, 255, 0, 120}

AA :: proc() {}

draw_fn :: proc() {
	v := rl.GetWindowScaleDPI()
	vx := cast(i32)v.x
	vy := cast(i32)v.y
	w := rl.GetRenderWidth()
	h := rl.GetRenderHeight()
	rl.ClearBackground({0, 0, 0, 255})
	// rl.DrawRectangle(100, 100, w / vx - 200, h / vy - 200, C_BG)
	rl.DrawFPS(10, 10)

}
