// BEGIN: This file is generated
// -- do not edit directly use code gen --
//---------------------------------------------------------------------------------------
// TODO REMOVE
//
package lyte


import "core:c"

_ :: c


Image :: rawptr

ImageBatch :: rawptr

Font :: rawptr

Music :: rawptr

Sound :: rawptr

ShaderBuilder :: rawptr

Shader :: rawptr

World :: rawptr

Body :: rawptr

Space :: rawptr

JointGroup :: rawptr

Geom :: rawptr

Joint :: rawptr

// TODO: remove
M :: struct {
	x, y: i32,
}

FloatVec4 :: struct {
	data:  [4]f32,
	count: uint,
}

ShaderUniformValue :: struct {
	which:   i32,
	options: struct #raw_union {
		float_val:     f32,
		vec_val:       FloatVec4,
		sampler2D_val: Image,
	},
}
