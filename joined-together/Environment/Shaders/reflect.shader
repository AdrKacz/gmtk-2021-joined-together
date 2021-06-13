shader_type canvas_item;

uniform vec4 water_color: hint_color;
uniform sampler2D noise;
uniform vec2 distortion_scale;
uniform float intensity;
uniform float speed;

uniform bool is_active;

void fragment() {
	if (is_active) {
		float distortion = texture(noise, UV * distortion_scale + TIME * speed).x;
		distortion -= 0.5;
		
		vec2 distorted_uv = vec2(UV.x - distortion * intensity, UV.y);
		vec4 color = texture(TEXTURE, distorted_uv);
		COLOR.rgb = mix(color.rgb, water_color.rgb, water_color.a);
	} else {
		COLOR = texture(TEXTURE, UV);
	}
}