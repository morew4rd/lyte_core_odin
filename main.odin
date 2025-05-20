package main

import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(1280, 720, "My Odin + Raylib game")

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground({0, 0, 0, 255});rl.EndDrawing()
	}

	rl.CloseWindow()

}
