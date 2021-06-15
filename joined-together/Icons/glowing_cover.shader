shader_type canvas_item;

uniform vec3 line_color = vec3(1.0, 1.0, 1.0);
uniform float line_thickness : hint_range(0, 10) = 0.1;
uniform float speed = 2.0;

void fragment() {
	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
	
	float outline = texture(TEXTURE, UV + vec2(-size.x, 0)).a;
	outline *= texture(TEXTURE, UV + vec2(0, size.y)).a;
	outline *= texture(TEXTURE, UV + vec2(size.x, 0)).a;
	outline *= texture(TEXTURE, UV + vec2(0, -size.y)).a;
	outline *= texture(TEXTURE, UV + vec2(-size.x, size.y)).a;
	outline *= texture(TEXTURE, UV + vec2(size.x, size.y)).a;
	outline *= texture(TEXTURE, UV + vec2(-size.x, -size.y)).a;
	outline *= texture(TEXTURE, UV + vec2(size.x, -size.y)).a;
	outline = 1.0 - outline;
	
	vec4 color = texture(TEXTURE, UV);
	vec4 outlined_result = mix(color, vec4(line_color, 1.0), outline * color.a);
	COLOR = mix(color, outlined_result, outlined_result.a);
}