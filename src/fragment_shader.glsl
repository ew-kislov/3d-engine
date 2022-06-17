#version 330 core

out vec4 color;

uniform int is_texture;
uniform sampler2D u_texture;
uniform sampler2D shadowMap;
uniform vec4 u_color;

in vec4 var_pos_coord;
in vec2 var_texture_coord;
in vec3 var_normal;
in vec4 var_pos_coord_in_light_space;

float ShadowCalculation(vec4 fragPosLightSpace)
{
    // perform perspective divide
    vec3 projCoords = fragPosLightSpace.xyz / fragPosLightSpace.w;
    // transform to [0,1] range
    projCoords = projCoords * 0.5 + 0.5;
    // get closest depth value from light's perspective (using [0,1] range fragPosLight as coords)
    float closestDepth = texture(shadowMap, var_pos_coord_in_light_space.xy).z; 
    // get depth of current fragment from light's perspective
    float currentDepth = var_pos_coord_in_light_space.z;
    // check whether current frag pos is in shadow
    float shadow = currentDepth > closestDepth  ? 1.0 : 0.0;

    return shadow;
}  

void main()
{
	vec3 light_pos = vec3(-11.0, 11.0, 0.0);
	vec3 light_color = vec3(0.6, 0.9, 0.6);
	float intense = 0.6;

	vec3 norm = normalize(var_normal);
	vec3 dir = normalize(light_pos - var_pos_coord.xyz);
	float coeff = clamp(dot(dir, norm), 0.0, 1.0);

	float diffuse = coeff * intense * 2.0 / 3.0;
	vec3 light_impact = coeff * light_color * intense / 3.0;

	float shadow = ShadowCalculation(var_pos_coord_in_light_space);

	if (is_texture == 1) {
		// color = (1.0 - shadow) * vec4(texture(u_texture, var_texture_coord).rgb * diffuse + light_impact, 1.0);
        color = vec4(vec3(texture(shadowMap, var_texture_coord).r), 1.0);
	} else {
		color = u_color;
	}
}