#pragma once

#include "Object.hpp"

#include "OpenGl.cpp"
#include "Texture.cpp"

Object::Object(EShape shape, glm::vec4 color) {
    this->shape = shape;
    this->color = color;
    this->texture = nullptr;

    this->position = glm::vec3(0.0f, 0.0f, 0.0f);
    this->rotation = glm::vec3(0.0f, 0.0f, 0.0f);
    this->scaleFactor = 1.0f;

    this->positionMatrix = glm::mat4(1.0);
    this->rotationMatrix = glm::mat4(1.0);
    this->scaleMatrix = glm::mat4(1.0);
}

Object::Object(EShape shape, Texture* texture) {
    this->shape = shape;
    this->texture = texture;

    this->position = glm::vec3(0.0f, 0.0f, 0.0f);
    this->rotation = glm::vec3(0.0f, 0.0f, 0.0f);
    this->scaleFactor = 1.0f;

    this->positionMatrix = glm::mat4(1.0);
    this->rotationMatrix = glm::mat4(1.0);
    this->scaleMatrix = glm::mat4(1.0);
}

void Object::rotate(glm::vec3 vector) {
    this->rotation += vector;

    this->rotationMatrix = glm::rotate(
        glm::rotate(
            glm::rotate(
                glm::mat4(1.0),
                glm::radians(this->rotation.x),
                glm::vec3(1.0, 0.0, 0.0)
            ),
            glm::radians(this->rotation.y),
            glm::vec3(0.0, 1.0, 0.0)
        ),
        glm::radians(this->rotation.z),
        glm::vec3(0.0, 0.0, 1.0)
    );
}

void Object::move(glm::vec3 vector) {
    this->position += vector;

    this->positionMatrix = glm::translate(glm::mat4(1.0), this->position);
}

void Object::scale(double factor) {
    this->scaleFactor = factor;

    this->scaleMatrix = glm::scale(glm::mat4(1.0), glm::vec3(factor, factor, factor));
}

void Object::draw(glm::mat4 cameraMatrix, glm::mat4 lightMatrix, GLuint depthMap) {
    OpenGL::useShader(EShaderType::Object);

    glm::mat4 model = this->positionMatrix * this->rotationMatrix * this->scaleMatrix;

    OpenGL::uniform4fv("u_vp_matrix", cameraMatrix);
    OpenGL::uniform4fv("u_model_matrix", model);
    OpenGL::uniform4fv("u_light_matrix", lightMatrix);

    if (this->texture != nullptr) {
        OpenGL::uniform1i("is_texture", 1);

        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, this->texture->getId());
        OpenGL::uniform1i("u_texture", 0);

        glActiveTexture(GL_TEXTURE1);
        glBindTexture(GL_TEXTURE_2D, depthMap);
        OpenGL::uniform1i("shadowMap", 1);
    } else {
        OpenGL::uniform1i("is_texture", 0);
        OpenGL::uniform4f("u_color", this->color);
    }

    OpenGL::drawVertices(this->shape);
}

void Object::drawShadowMap(glm::mat4 lightMatrix) {
    OpenGL::useShader(EShaderType::Shadow);

    glm::mat4 model = this->positionMatrix * this->rotationMatrix * this->scaleMatrix;

    OpenGL::uniform4fv("u_light_matrix", lightMatrix);
    OpenGL::uniform4fv("u_model_matrix", model);

    OpenGL::drawVertices(this->shape);
}
