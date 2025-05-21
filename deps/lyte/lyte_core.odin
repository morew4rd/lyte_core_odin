//
package lyte

import "core:c"

_ :: c


// -------------------------
// core data types
// -------------------------
Size :: struct {
	width, height: i32,
}

Args :: struct {
	argc: i32,
	argv: ^^u8,
}

TickFunction :: proc "c" (_: rawptr, _: f32, _: i32, _: i32, _: bool, _: bool)

Config :: struct {
	args:            Args,
	fullscreen:      bool,
	vsync:           bool,
	exe_name:        cstring,

	// const char *window_title;
	window_size:     Size,
	window_min_size: Size,
	blendmode:       BlendMode,
	filtermode:      FilterMode,
}

foreign import lib {"libraudio.a", "libfreetype.a", "liblyte_core.a", "libphysfs.a", "libglfw3.a", "system:png", "system:z", "system:Cocoa.framework", "system:IOKit.framework", "system:OpenGL.framework"
//
}


@(default_calling_convention = "c", link_prefix = "lyte_")
foreign lib {
	// -------------------------
	// core state
	// -------------------------
	core_state_init :: proc(config: Config) -> i32 ---
	core_state_has_arg :: proc(name: cstring) -> bool ---
	core_state_get_arg :: proc(name: cstring) -> cstring ---
	core_state_get_arg_bool :: proc(name: cstring) -> bool ---
	quit :: proc() -> i32 ---
	set_color :: proc(r: f64, g: f64, b: f64, a: f64) -> i32 ---
	reset_color :: proc() -> i32 ---
	set_default_blendmode :: proc(blendmode: BlendMode) -> i32 ---
	set_blendmode :: proc(blendmode: BlendMode) -> i32 ---
	reset_blendmode :: proc() -> i32 ---
	set_default_filtermode :: proc(filtermode: FilterMode) -> i32 ---
	set_filtermode :: proc(filtermode: FilterMode) -> i32 ---
	reset_filtermode :: proc() -> i32 ---
	cls :: proc(r: f64, g: f64, b: f64, a: f64) -> i32 ---
	push_matrix :: proc() -> i32 ---
	pop_matrix :: proc() -> i32 ---
	reset_matrix :: proc() -> i32 ---
	translate :: proc(delta_x: f64, delta_y: f64) -> i32 ---
	rotate :: proc(angle: f64) -> i32 ---
	rotate_at :: proc(angle: f64, x: f64, y: f64) -> i32 ---
	scale :: proc(scale_x: f64, scale_y: f64) -> i32 ---
	scale_at :: proc(scale_x: f64, scale_y: f64, x: f64, y: f64) -> i32 ---

	// -------------------------
	// core_window
	// -------------------------
	core_window_init :: proc() -> i32 ---
	core_window_cleanup :: proc() -> i32 ---
	get_monitor_count :: proc(val: ^i32) -> i32 ---
	get_monitor_name :: proc(index: i32, val: ^^u8) -> i32 ---
	get_monitor_width :: proc(index: i32, val: ^i32) -> i32 ---
	get_monitor_height :: proc(index: i32, val: ^i32) -> i32 ---
	set_window_monitor :: proc(index: i32) -> i32 ---
	set_window_resizable :: proc(resizable: bool) -> i32 ---
	set_window_minsize :: proc(width: i32, height: i32) -> i32 ---
	set_window_size :: proc(width: i32, height: i32) -> i32 ---
	get_window_width :: proc(val: ^i32) -> i32 ---
	get_window_height :: proc(val: ^i32) -> i32 ---
	set_window_position :: proc(x: i32, y: i32) -> i32 ---
	set_fullscreen :: proc(fullscreen: bool) -> i32 ---
	is_fullscreen :: proc(val: ^bool) -> i32 ---
	set_window_title :: proc(title: cstring) -> i32 ---
	set_window_icon_file :: proc(icon_path: cstring) -> i32 ---
	set_window_vsync :: proc(vsync: bool) -> i32 ---
	is_window_vsync :: proc(val: ^bool) -> i32 ---
	set_window_margins :: proc(left: i32, right: i32, top: i32, bottom: i32) -> i32 ---
	set_window_paddings :: proc(left: i32, right: i32, top: i32, bottom: i32) -> i32 ---

	// -------------------------
	// core_input
	// -------------------------
	core_input_init :: proc() -> i32 ---
	core_input_cleanup :: proc() -> i32 ---
	core_input_update_state :: proc() -> i32 ---
	is_key_down :: proc(key: KeyboardKey, val: ^bool) -> i32 ---
	is_key_pressed :: proc(key: KeyboardKey, val: ^bool) -> i32 ---
	is_key_released :: proc(key: KeyboardKey, val: ^bool) -> i32 ---
	is_key_repeat :: proc(key: KeyboardKey, val: ^bool) -> i32 ---
	get_pressed_keys :: proc(keys: ^^i32, num_keys: ^uint) -> i32 ---
	get_textinput :: proc(val: ^^u8) -> i32 ---
	is_mouse_down :: proc(mouse_button: MouseButton, val: ^bool) -> i32 ---
	is_mouse_pressed :: proc(mouse_button: MouseButton, val: ^bool) -> i32 ---
	is_mouse_released :: proc(mouse_button: MouseButton, val: ^bool) -> i32 ---
	get_mouse_x :: proc(val: ^i32) -> i32 ---
	get_mouse_y :: proc(val: ^i32) -> i32 ---
	get_gamepad_count :: proc(val: ^i32) -> i32 ---
	get_gamepad_name :: proc(index: i32, val: ^^u8) -> i32 ---
	is_gamepad_down :: proc(index: i32, gamepad_button: GamepadButton, val: ^bool) -> i32 ---
	is_gamepad_pressed :: proc(index: i32, gamepad_button: GamepadButton, val: ^bool) -> i32 ---
	is_gamepad_released :: proc(index: i32, gamepad_button: GamepadButton, val: ^bool) -> i32 ---
	get_gamepad_axis :: proc(index: i32, gamepad_axis: GamepadAxis, val: ^f64) -> i32 ---

	// -------------------------
	// core_loop
	// -------------------------
	core_start_loop :: proc(tick_fn: TickFunction, app_data: rawptr) -> i32 ---
	core_set_loop :: proc(tick_fn: TickFunction, app_data: rawptr) -> i32 ---

	// -------------------------
	// core_filesystem
	// -------------------------
	core_filesystem_init :: proc() -> i32 ---
	core_filesystem_cleanup :: proc() -> i32 ---
	core_filesystem_update_tasks :: proc() -> i32 ---
	core_filesystem_check_fetch_file_in_progress :: proc(handle: u32) -> bool ---
	core_filesystem_check_fetch_file_failed :: proc(handle: u32) -> bool ---
	core_filesystem_check_fetch_file_succeeded :: proc(handle: u32) -> bool ---
	core_filesystem_fetch_file_async :: proc(name: cstring, path: cstring, est_max_size: uint, mount_path: cstring) -> u32 ---
	core_filesystem_set_writeable_path :: proc(path: cstring) -> i32 ---
	core_filesystem_add_path_local :: proc(path: cstring, mount_path: cstring) -> i32 ---
	core_filesystem_add_path_memory :: proc(name: cstring, buf: rawptr, size: uint, mount_path: cstring) -> i32 ---
	load_textfile :: proc(file_path: cstring, val: ^^u8) -> i32 ---
	save_textfile :: proc(file_path: cstring, data: cstring) -> i32 ---
	save_textfile_append :: proc(file_path: cstring, data: cstring) -> i32 ---

	// -------------------------
	// core_image
	// -------------------------
	core_image_init :: proc() -> i32 ---
	core_image_cleanup :: proc() -> i32 ---
	load_image :: proc(path: cstring, img: ^Image) -> i32 ---
	new_canvas :: proc(w: i32, h: i32, img: ^Image) -> i32 ---
	Image_cleanup :: proc(image: Image) -> i32 ---
	get_image_width :: proc(image: Image, val: ^i32) -> i32 ---
	get_image_height :: proc(image: Image, val: ^i32) -> i32 ---
	draw_image :: proc(image: Image, x: f64, y: f64) -> i32 ---
	draw_image_ex :: proc(image: Image, x: f64, y: f64, angle: f64, ox: f64, oy: f64, sx: f64, sy: f64) -> i32 ---
	draw_image_rect :: proc(image: Image, x: f64, y: f64, src_x: f64, src_y: f64, src_w: f64, src_h: f64) -> i32 ---
	draw_image_rect_ex :: proc(image: Image, x: f64, y: f64, src_x: f64, src_y: f64, src_w: f64, src_h: f64, angle: f64, ox: f64, oy: f64, sx: f64, sy: f64) -> i32 ---
	set_canvas :: proc(image: Image) -> i32 ---
	reset_canvas :: proc() -> i32 ---
	is_image_canvas :: proc(image: Image, val: ^bool) -> i32 ---
	capture_image :: proc(x: i32, y: i32, w: i32, h: i32, val: ^Image) -> i32 ---
	new_imagebatch :: proc(image: Image, val: ^ImageBatch) -> i32 ---
	ImageBatch_cleanup :: proc(imagebatch: ImageBatch) -> i32 ---
	reset_imagebatch :: proc(imagebatch: ImageBatch) -> i32 ---
	add_imagebatch_rect :: proc(imagebatch: ImageBatch, dest_x: f64, dest_y: f64, dest_width: f64, dest_height: f64, src_x: f64, src_y: f64, src_width: f64, src_height: f64) -> i32 ---
	get_imagebatch_rect_count :: proc(imagebatch: ImageBatch, val: ^i32) -> i32 ---
	draw_imagebatch :: proc(imagebatch: ImageBatch) -> i32 ---

	// -------------------------
	// core_shapes
	// -------------------------
	draw_point :: proc(x: f64, y: f64) -> i32 ---
	draw_line :: proc(x1: f64, y1: f64, x2: f64, y2: f64) -> i32 ---
	draw_triangle :: proc(ax: f64, ay: f64, bx: f64, by: f64, cx: f64, cy: f64) -> i32 ---
	draw_triangle_line :: proc(ax: f64, ay: f64, bx: f64, by: f64, cx: f64, cy: f64) -> i32 ---
	draw_rect :: proc(dest_x: f64, dest_y: f64, rect_width: f64, rect_height: f64) -> i32 ---
	draw_rect_line :: proc(dest_x: f64, dest_y: f64, rect_width: f64, rect_height: f64) -> i32 ---
	draw_circle :: proc(dest_x: f64, dest_y: f64, radius: f64) -> i32 ---
	draw_circle_line :: proc(dest_x: f64, dest_y: f64, radius: f64) -> i32 ---
	draw_ellipse :: proc(dest_x: f64, dest_y: f64, radius_x: f64, radius_y: f64) -> i32 ---
	draw_ellipse_line :: proc(dest_x: f64, dest_y: f64, radius_x: f64, radius_y: f64) -> i32 ---

	// -------------------------
	// core_audio
	// -------------------------
	core_audio_init :: proc() -> i32 ---
	core_audio_cleanup :: proc() -> i32 ---
	core_audio_update_music_streams :: proc() -> i32 --- // needs to run each frame

	// general
	get_mastervolume :: proc(vol: ^f64) -> i32 ---
	set_mastervolume :: proc(vol: f64) -> i32 ---

	// music
	load_music :: proc(path: cstring, mus: ^Music) -> i32 ---
	Music_cleanup :: proc(mus: Music) -> i32 ---
	play_music :: proc(mus: Music) -> i32 ---
	pause_music :: proc(mus: Music) -> i32 ---
	resume_music :: proc(mus: Music) -> i32 ---
	stop_music :: proc(mus: Music) -> i32 ---
	is_music_playing :: proc(mus: Music, val: ^bool) -> i32 ---
	get_music_volume :: proc(mus: Music, val: ^f64) -> i32 ---
	get_music_pan :: proc(mus: Music, val: ^f64) -> i32 ---
	get_music_pitch :: proc(mus: Music, val: ^f64) -> i32 ---
	get_music_length :: proc(mus: Music, secs: ^f64) -> i32 ---
	get_music_length_played :: proc(mus: Music, secs: ^f64) -> i32 ---
	set_music_volume :: proc(mus: Music, vol: f64) -> i32 ---
	set_music_pan :: proc(mus: Music, pan: f64) -> i32 ---
	set_music_pitch :: proc(mus: Music, pitch: f64) -> i32 ---
	seek_music :: proc(mus: Music, secs: f64) -> i32 ---

	// sound
	load_sound :: proc(sound_path: cstring, val: ^Sound) -> i32 ---
	clone_sound :: proc(orig: Sound, val: ^Sound) -> i32 ---
	Sound_cleanup :: proc(sound: Sound) -> i32 ---
	play_sound :: proc(snd: Sound) -> i32 ---
	pause_sound :: proc(snd: Sound) -> i32 ---
	resume_sound :: proc(snd: Sound) -> i32 ---
	stop_sound :: proc(snd: Sound) -> i32 ---
	is_sound_playing :: proc(snd: Sound, val: ^bool) -> i32 ---
	get_sound_volume :: proc(snd: Sound, val: ^f64) -> i32 ---
	get_sound_pan :: proc(snd: Sound, val: ^f64) -> i32 ---
	get_sound_pitch :: proc(snd: Sound, val: ^f64) -> i32 ---
	set_sound_volume :: proc(snd: Sound, volume: f64) -> i32 ---
	set_sound_pan :: proc(snd: Sound, pan: f64) -> i32 ---
	set_sound_pitch :: proc(snd: Sound, pitch: f64) -> i32 ---

	// -------------------------
	// core_font
	// -------------------------
	core_font_init :: proc() -> i32 ---
	core_font_cleanup :: proc() -> i32 ---
	load_font :: proc(font_path: cstring, size: f64, val: ^Font) -> i32 ---
	Font_cleanup :: proc(font: Font) -> i32 ---
	set_font :: proc(font: Font) -> i32 ---
	draw_text :: proc(text: cstring, dest_x: f64, dest_y: f64) -> i32 ---
	get_text_width :: proc(text: cstring, val: ^i32) -> i32 ---
	get_text_height :: proc(text: cstring, val: ^i32) -> i32 ---

	// -------------------------
	// core_shader
	// -------------------------
	core_shader_init :: proc() -> i32 ---
	core_shader_cleanup :: proc() -> i32 ---
	core_shader_set_color :: proc() -> i32 ---

	// ShaderBuilder
	new_shaderbuilder :: proc(val: ^ShaderBuilder) -> i32 ---
	ShaderBuilder_cleanup :: proc(shaderbuilder: ShaderBuilder) -> i32 ---
	shaderbuilder_uniform :: proc(shaderbuilder: ShaderBuilder, uniform_name: cstring, uniform_type: UniformType) -> i32 ---
	shaderbuilder_vertex :: proc(shaderbuilder: ShaderBuilder, vertex_code: cstring) -> i32 ---
	shaderbuilder_fragment :: proc(shaderbuilder: ShaderBuilder, fragment_code: cstring) -> i32 ---

	// Shader
	shaderbuilder_build :: proc(shaderbuilder: ShaderBuilder, shader: ^Shader) -> i32 ---
	Shader_cleanup :: proc(shader: Shader) -> i32 ---
	set_shader :: proc(shader: Shader) -> i32 ---
	reset_shader :: proc() -> i32 ---
	set_shader_uniform :: proc(shader: Shader, uniform_name: cstring, uniform_value: ShaderUniformValue) -> i32 ---
	reset_shader_uniform :: proc(shader: Shader, uniform_name: cstring) -> i32 ---
}
