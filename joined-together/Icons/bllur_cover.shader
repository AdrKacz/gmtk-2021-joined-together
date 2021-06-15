shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise;
uniform vec2 distortion_scale;
uniform float speed;
uniform float intensity;
uniform float timestamp: hint_range(0, 100000);

void fragment() {
	float distortion = texture(noise, UV * distortion_scale + timestamp * speed).x;
	distortion -= 0.5;
	
	vec2 distorted_screen_uv = vec2(SCREEN_UV.x - distortion * intensity, SCREEN_UV.y);
	vec4 screen_color = texture(SCREEN_TEXTURE, distorted_screen_uv);
	
	COLOR = vec4(screen_color.rgb, 1.0);
}