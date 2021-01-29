shader_type canvas_item;

uniform float activation : hint_range(0.0, 1.0) = 0.0;
uniform vec2 origin = vec2(0.0, 0.0);
uniform bool simple = true;

float sdCircle( vec2 p, float r )
{
    return length(p) - r;
}

varying vec2 world_pos;

void vertex() {
	world_pos = (WORLD_MATRIX * vec4(VERTEX, 1.0, 1.0)).xy;
}

void fragment() {

	vec2 uv = UV;
	vec2 texSize = vec2(textureSize(TEXTURE, 1));
	vec4 tex = texture(TEXTURE, uv);
	
	vec2 resolution = 1.0 / SCREEN_PIXEL_SIZE;
	
	vec2 centered = uv - vec2(0.14, 0.80);
	centered = uv - origin;
	
	if (simple) {
		float lum = (tex.r+tex.g+tex.b) * 0.3333;
		COLOR = mix(vec4(vec3(lum), tex.a), tex, vec4(activation));
	} else {
			// Make texture black and white
		vec4 bw = vec4(vec3(dot(tex.rgb, vec3(0.299, 0.587, 0.114))), tex.a);
		// vec4 activated_tex = mix(bw, tex, vec4(activation));
		
		float circle = step(activation, sdCircle(centered, activation));
		
		vec4 col = mix(tex, bw, vec4(circle));
		
		COLOR = col;
		// COLOR = mix(vec4(centered.x, 0.0, centered.y, 1.0), col, 0.5);
		// COLOR = vec4(centered.x, 0.0, centered.y, 1.0);
		// COLOR = col;
		// float lum = (tex.r+tex.g+tex.b) * 0.3333;
		// COLOR = vec4(lum, lum, lum, tex.a);	
	}
}