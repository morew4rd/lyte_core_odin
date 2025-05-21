// GENERATED
// (c) 2023 MG
//
package lyte


import "core:c"

_ :: c


// lyte enums (do not add new values or change the names. changing values per implementation/platform is OK.)
// (EDITED values)
UniformType :: enum c.int {
	_INVALID     = 0, // order: 0, str: '_invalid'
	FLOAT        = 1, // order: 1, str: 'float'
	VEC2         = 2, // order: 2, str: 'vec2'
	VEC3         = 3, // order: 3, str: 'vec3'
	VEC4         = 4, // order: 4, str: 'vec4'
	INT          = 5, // order: 5, str: 'int'
	IVEC2        = 6, // order: 6, str: 'ivec2'
	IVEC3        = 7, // order: 7, str: 'ivec3'
	IVEC4        = 8, // order: 8, str: 'ivec4'
	MAT4         = 9, // order: 9, str: 'mat4'
	SAMPLER2D    = 10, // order: 10, str: 'sampler2D'
	COUNT        = 11,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}

BlendMode :: enum c.int {
	NONE         = 0, // order: 0, str: 'none'
	BLEND        = 1, // order: 1, str: 'blend'
	ADD          = 2, // order: 2, str: 'add'
	MOD          = 3, // order: 3, str: 'mod'
	MUL          = 4, // order: 4, str: 'mul'
	COUNT        = 5,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}

FilterMode :: enum c.int {
	_INVALID     = 1, // order: 0, str: '_invalid'
	NEAREST      = 2, // order: 1, str: 'nearest'
	LINEAR       = 3, // order: 2, str: 'linear'
	COUNT        = 3,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}

GamepadAxis :: enum c.int {
	LEFT_X        = 0, // order: 0, str: 'left_x'
	LEFT_Y        = 1, // order: 1, str: 'left_y'
	RIGHT_X       = 2, // order: 2, str: 'right_x'
	RIGHT_Y       = 3, // order: 3, str: 'right_y'
	LEFT_TRIGGER  = 4, // order: 4, str: 'left_trigger'
	RIGHT_TRIGGER = 5, // order: 5, str: 'right_trigger'
	COUNT         = 6,
	FORCE_UINT32  = 2147483647, // inspired by sokol_gfx enums
}

GamepadButton :: enum c.int {
	PAD_A        = 0, // order: 0, str: 'pad_a'
	PAD_B        = 1, // order: 1, str: 'pad_b'
	PAD_X        = 2, // order: 2, str: 'pad_x'
	PAD_Y        = 3, // order: 3, str: 'pad_y'
	LEFT_BUMPER  = 4, // order: 4, str: 'left_bumper'
	RIGHT_BUMPER = 5, // order: 5, str: 'right_bumper'
	BACK         = 6, // order: 6, str: 'back'
	START        = 7, // order: 7, str: 'start'
	GUIDE        = 8, // order: 8, str: 'guide'
	LEFT_THUMB   = 9, // order: 9, str: 'left_thumb'
	RIGHT_THUMB  = 10, // order: 10, str: 'right_thumb'
	DPAD_UP      = 11, // order: 11, str: 'dpad_up'
	DPAD_RIGHT   = 12, // order: 12, str: 'dpad_right'
	DPAD_DOWN    = 13, // order: 13, str: 'dpad_down'
	DPAD_LEFT    = 14, // order: 14, str: 'dpad_left'
	COUNT        = 15,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}

MouseButton :: enum c.int {
	MB1          = 0, // order: 0, str: 'mb1'
	MB2          = 1, // order: 1, str: 'mb2'
	MB3          = 2, // order: 2, str: 'mb3'
	MB4          = 3, // order: 3, str: 'mb4'
	MB5          = 4, // order: 4, str: 'mb5'
	MB6          = 5, // order: 5, str: 'mb6'
	MB7          = 6, // order: 6, str: 'mb7'
	MB8          = 7, // order: 7, str: 'mb8'
	SCROLLUP     = 8, // order: 8, str: 'scrollup'
	SCROLLDOWN   = 9, // order: 9, str: 'scrolldown'
	COUNT        = 10,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}

KeyboardKey :: enum c.int {
	SPACE         = 32, // order: 0, str: 'space'
	TICK          = 39, // order: 1, str: '''
	COMMA         = 44, // order: 2, str: ','
	DASH          = 45, // order: 3, str: '-'
	PERIOD        = 46, // order: 4, str: '.'
	SLASH         = 47, // order: 5, str: '/'
	_0            = 48, // order: 6, str: '0'
	_1            = 49, // order: 7, str: '1'
	_2            = 50, // order: 8, str: '2'
	_3            = 51, // order: 9, str: '3'
	_4            = 52, // order: 10, str: '4'
	_5            = 53, // order: 11, str: '5'
	_6            = 54, // order: 12, str: '6'
	_7            = 55, // order: 13, str: '7'
	_8            = 56, // order: 14, str: '8'
	_9            = 57, // order: 15, str: '9'
	SEMICOLON     = 59, // order: 16, str: ';'
	EQUAL         = 61, // order: 17, str: '='
	A             = 65, // order: 18, str: 'a'
	B             = 66, // order: 19, str: 'b'
	C             = 67, // order: 20, str: 'c'
	D             = 68, // order: 21, str: 'd'
	E             = 69, // order: 22, str: 'e'
	F             = 70, // order: 23, str: 'f'
	G             = 71, // order: 24, str: 'g'
	H             = 72, // order: 25, str: 'h'
	I             = 73, // order: 26, str: 'i'
	J             = 74, // order: 27, str: 'j'
	K             = 75, // order: 28, str: 'k'
	L             = 76, // order: 29, str: 'l'
	M             = 77, // order: 30, str: 'm'
	N             = 78, // order: 31, str: 'n'
	O             = 79, // order: 32, str: 'o'
	P             = 80, // order: 33, str: 'p'
	Q             = 81, // order: 34, str: 'q'
	R             = 82, // order: 35, str: 'r'
	S             = 83, // order: 36, str: 's'
	T             = 84, // order: 37, str: 't'
	U             = 85, // order: 38, str: 'u'
	V             = 86, // order: 39, str: 'v'
	W             = 87, // order: 40, str: 'w'
	X             = 88, // order: 41, str: 'x'
	Y             = 89, // order: 42, str: 'y'
	Z             = 90, // order: 43, str: 'z'
	OPEN_BRACKET  = 91, // order: 44, str: '['
	BACKSLASH     = 92, // order: 45, str: '\'
	CLOSE_BRACKET = 93, // order: 46, str: ']'
	BACKTICK      = 96, // order: 47, str: '`'
	WORLD_1       = 161, // order: 48, str: 'world_1'
	WORLD_2       = 162, // order: 49, str: 'world_2'
	ESCAPE        = 256, // order: 50, str: 'escape'
	ENTER         = 257, // order: 51, str: 'enter'
	TAB           = 258, // order: 52, str: 'tab'
	BACKSPACE     = 259, // order: 53, str: 'backspace'
	INSERT        = 260, // order: 54, str: 'insert'
	DELETE        = 261, // order: 55, str: 'delete'
	RIGHT         = 262, // order: 56, str: 'right'
	LEFT          = 263, // order: 57, str: 'left'
	DOWN          = 264, // order: 58, str: 'down'
	UP            = 265, // order: 59, str: 'up'
	PAGE_UP       = 266, // order: 60, str: 'page_up'
	PAGE_DOWN     = 267, // order: 61, str: 'page_down'
	HOME          = 268, // order: 62, str: 'home'
	END           = 269, // order: 63, str: 'end'
	CAPS_LOCK     = 280, // order: 64, str: 'caps_lock'
	SCROLL_LOCK   = 281, // order: 65, str: 'scroll_lock'
	NUM_LOCK      = 282, // order: 66, str: 'num_lock'
	PRINT_SCREEN  = 283, // order: 67, str: 'print_screen'
	PAUSE         = 284, // order: 68, str: 'pause'
	F1            = 290, // order: 69, str: 'f1'
	F2            = 291, // order: 70, str: 'f2'
	F3            = 292, // order: 71, str: 'f3'
	F4            = 293, // order: 72, str: 'f4'
	F5            = 294, // order: 73, str: 'f5'
	F6            = 295, // order: 74, str: 'f6'
	F7            = 296, // order: 75, str: 'f7'
	F8            = 297, // order: 76, str: 'f8'
	F9            = 298, // order: 77, str: 'f9'
	F10           = 299, // order: 78, str: 'f10'
	F11           = 300, // order: 79, str: 'f11'
	F12           = 301, // order: 80, str: 'f12'
	F13           = 302, // order: 81, str: 'f13'
	F14           = 303, // order: 82, str: 'f14'
	F15           = 304, // order: 83, str: 'f15'
	F16           = 305, // order: 84, str: 'f16'
	F17           = 306, // order: 85, str: 'f17'
	F18           = 307, // order: 86, str: 'f18'
	F19           = 308, // order: 87, str: 'f19'
	F20           = 309, // order: 88, str: 'f20'
	F21           = 310, // order: 89, str: 'f21'
	F22           = 311, // order: 90, str: 'f22'
	F23           = 312, // order: 91, str: 'f23'
	F24           = 313, // order: 92, str: 'f24'
	F25           = 314, // order: 93, str: 'f25'
	KP_0          = 320, // order: 94, str: 'kp_0'
	KP_1          = 321, // order: 95, str: 'kp_1'
	KP_2          = 322, // order: 96, str: 'kp_2'
	KP_3          = 323, // order: 97, str: 'kp_3'
	KP_4          = 324, // order: 98, str: 'kp_4'
	KP_5          = 335, // order: 99, str: 'kp_5'
	KP_6          = 326, // order: 100, str: 'kp_6'
	KP_7          = 327, // order: 101, str: 'kp_7'
	KP_8          = 328, // order: 102, str: 'kp_8'
	KP_9          = 329, // order: 103, str: 'kp_9'
	KP_DECIMAL    = 330, // order: 104, str: 'kp_decimal'
	KP_DIVIDE     = 331, // order: 105, str: 'kp_divide'
	KP_MULTIPLY   = 332, // order: 106, str: 'kp_multiply'
	KP_SUBTRACT   = 333, // order: 107, str: 'kp_subtract'
	KP_ADD        = 334, // order: 108, str: 'kp_add'
	KP_ENTER      = 335, // order: 109, str: 'kp_enter'
	KP_EQUAL      = 336, // order: 110, str: 'kp_equal'
	LEFT_SHIFT    = 340, // order: 111, str: 'left_shift'
	LEFT_CONTROL  = 341, // order: 112, str: 'left_control'
	LEFT_ALT      = 342, // order: 113, str: 'left_alt'
	LEFT_SUPER    = 343, // order: 114, str: 'left_super'
	RIGHT_SHIFT   = 344, // order: 115, str: 'right_shift'
	RIGHT_CONTROL = 345, // order: 116, str: 'right_control'
	RIGHT_ALT     = 346, // order: 117, str: 'right_alt'
	RIGHT_SUPER   = 347, // order: 118, str: 'right_super'
	MENU          = 348, // order: 119, str: 'menu'
	COUNT         = 120,
	FORCE_UINT32  = 2147483647, // inspired by sokol_gfx enums
}

GeomClass :: enum c.int {
	// MG: values map to ODE
	CIRCLE       = 0,

	// MG: values map to ODE
	RECT         = 1,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}

JointClass :: enum c.int {
	// MG: values map to ODE (dJointType)
	HINGE        = 2,

	// MG: values map to ODE (dJointType)
	SLIDER       = 3,

	// MG: values map to ODE (dJointType)
	FIXED        = 7,
	FORCE_UINT32 = 2147483647, // inspired by sokol_gfx enums
}
