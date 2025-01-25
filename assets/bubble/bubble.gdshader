shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float refractionMagnitude = 30.0;
uniform sampler2D test;

void fragment() {

	vec3 refraction = - texture(NORMAL_TEXTURE, UV).rgb * vec3(	1.0, -1.0, 1.0);

	vec4 textureRead = texture(TEXTURE, UV);
	vec4 offsetScreenRead = textureLod(SCREEN_TEXTURE, SCREEN_UV + refraction.rg/refractionMagnitude, 0.0);

	vec4 testR = texture(test, UV);

	if (testR.a < 0.5) {
		COLOR = offsetScreenRead;
	}
	else {
		COLOR = textureRead;
	}
}