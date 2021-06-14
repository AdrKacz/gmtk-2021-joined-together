shader_type canvas_item;

uniform sampler2D noise;
uniform vec3 color = vec3(1.0, 1.0, 1.0);
uniform float STRENGHT = 0.25;
uniform float SPEED = 0.2;

void fragment() {
	vec2 coord = UV * 0.3;
	
	vec4 noise_texture = texture(noise, coord + vec2(TIME * - SPEED, TIME * SPEED));
	vec2 motion = noise_texture.xx;
	
	float final = motion.y;
	
	COLOR = vec4(color, final * STRENGHT);
}