shader_type canvas_item;

uniform vec3 color = vec3(1.0, 1.0, 1.0);
uniform float baseTime = 0.3;
uniform bool is_active = false;
uniform float power = 0.5;

float rand(vec2 coord) {
	return fract(sin(dot(coord, vec2(56, 78)) * 1000.0) * 1000.0);
}

void fragment() {
	if (is_active) {
		float a = cos(TIME * 6.3 / baseTime);
		float b = rand(UV + rand(vec2(TIME))) * cos(TIME * rand(UV) * 10.0 / baseTime);
	
		COLOR = vec4(color, power * min(a + b, 1.0));
	} else {
		COLOR = vec4(color, 0);
	}
	
}