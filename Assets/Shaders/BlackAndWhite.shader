shader_type canvas_item;

void fragment() {
	vec2 uv = UV;
	vec4 tex = texture(TEXTURE, uv);
	
	vec3 rgb = vec3(dot(tex.rgb, vec3(0.299, 0.587, 0.114)));
	COLOR = vec4(rgb, tex.a);
	
	// float lum = (tex.r+tex.g+tex.b) * 0.3333;
	// COLOR = vec4(lum, lum, lum, tex.a);
}