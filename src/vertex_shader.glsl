#version 330 core

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texture_coord;

out vec4 var_pos_coord;
out vec2 var_texture_coord;
out vec3 var_normal;
out vec4 var_pos_coord_in_light_space;

uniform mat4 u_vp_matrix;
uniform mat4 u_model_matrix;
uniform mat4 u_light_matrix;

void main(){
    gl_Position = u_vp_matrix * u_model_matrix * vec4(position, 1.0);
    var_pos_coord = u_model_matrix * vec4(position, 1.0);

    var_normal = mat3(transpose(inverse(u_model_matrix))) * normal;
    var_texture_coord = texture_coord;
    var_pos_coord_in_light_space = u_light_matrix * vec4(vec3(u_model_matrix * vec4(position, 1.0)), 1.0);
}