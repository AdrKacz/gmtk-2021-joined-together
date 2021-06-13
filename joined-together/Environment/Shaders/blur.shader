shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise;
uniform vec2 distortion_scale;
uniform float speed;
uniform float intensity;

void fragment() {
	float distortion = texture(noise, UV * distortion_scale + TIME * speed).x;
	distortion -= 0.5;
	
	vec2 distorted_screen_uv = vec2(SCREEN_UV.x - distortion * intensity, SCREEN_UV.y);
	vec4 screen_color = texture(SCREEN_TEXTURE, distorted_screen_uv);
	
	COLOR = vec4(screen_color.rgb, 1.0);
}