//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D LUTSampler;
uniform vec4 u_vA;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	
	float u  =  floor(color.b * 15.0) / 15.0 * 240.0;
        u  = (floor(color.r * 15.0) / 15.0 *  15.0) + u;
        u /= 255.0;
	float v  = 1.0 - (floor(color.g * 15.0) / 15.0);
	
	float uu = u_vA.z * u + u_vA.x;
	float vv = u_vA.w * u + u_vA.y;

	vec3 left = texture2D(LUTSampler, vec2(uu, vv)).rgb;

	u  =  ceil(color.b * 15.0) / 15.0 * 240.0;
	u  = (ceil(color.r * 15.0) / 15.0 *  15.0) + u;
	u /= 255.0;
	v  = 1.0 - (ceil(color.g * 15.0) / 15.0);
	
	uu = u_vA.z * u + u_vA.x;
	vv = u_vA.w * u + u_vA.y;

	vec3 right = texture2D(LUTSampler, vec2(uu, vv)).rgb;


	color.r = mix(left.r, right.r, fract(color.r * 15.0));
	color.g = mix(left.g, right.g, fract(color.g * 15.0));
	color.b = mix(left.b, right.b, fract(color.b * 15.0));
	
	
	//vec4 color = texture2D(LUTSampler, vec2(8,8));
	
	//gl_FragColor = vec4(1.0, 1.0, 1.0, albedo.a);
	gl_FragColor = color;
	//gl_FragColor = vec4(u, v, 0, color.a);
	//gl_FragColor = vec4(texture2D(LUTSampler,v_vTexcoord).rgb, color.a);
	
}

