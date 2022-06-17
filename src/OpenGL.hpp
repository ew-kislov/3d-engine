#ifndef OPENGL_H
#define OPENGL_H

#include <GL/glew.h>

#include <map>
#include <vector>
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>

#include <glm/glm.hpp>

using namespace std;

enum EShape {
    Cube = 1,
    Floor = 2
};

enum class EShaderType {
    Object = 1,
    Shadow = 2
};

class OpenGL {
    private:
        static map<EShaderType, GLuint> programs;
        static map<EShape, GLuint> vaos;
        static map<EShape, GLuint> trianglesNum;

        static GLuint activeProgram;
        static GLuint activeTexture;
        static GLuint activeVao;

        static void initShapeVaos();
        static void initShaders();
        static void initShapeVao(EShape shape, vector<GLfloat> vertices);

    public:
        static void init();
        static GLuint createShader(EShaderType shaderType, char* vertexShaderSource, char* fragmentShaderSource);
        static void useShader(EShaderType shaderType);
        static void bindTexture(GLuint id);
        static void bindVao(GLuint id);
        static void drawVertices(EShape shape);

        static void uniform4fv(string name, glm::mat4 matrix);
        static void uniform4f(string name, glm::vec4 vector);
        static void uniform1i(string name, int integer);
};

#endif