#ifndef OBJECT_H
#define OBJECT_H

#include <GL/glew.h>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

#include "OpenGL.hpp"
#include "Texture.hpp"

class Object {
    private:
        GLuint programId;

        EShape shape;
        glm::vec4 color;
        Texture* texture;

        glm::vec3 position;
        double scaleFactor;
        glm::vec3 rotation;

        glm::mat4 positionMatrix;
        glm::mat4 scaleMatrix;
        glm::mat4 rotationMatrix;
        glm::mat4 modelMatrix;

    public:
        Object(EShape shape, glm::vec4 color);
        Object(EShape shape, Texture* texture);

        void rotate(glm::vec3 vector);
        void move(glm::vec3 vector);
        void scale(double factor);

        glm::mat4 getModelMatrix();

        void draw(glm::mat4 cameraMatrix, glm::mat4 lightMatrix, GLuint depthMap);
        void drawShadowMap(glm::mat4 lightMatrix);
};

#endif