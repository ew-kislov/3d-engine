#pragma once

#include "OpenGL.hpp"

#include "shapes.cpp"

map<EShaderType, GLuint> OpenGL::programs = {};
map<EShape, GLuint> OpenGL::vaos = {};
map<EShape, GLuint> OpenGL::trianglesNum = {};
GLuint OpenGL::activeProgram = -1;
GLuint OpenGL::activeTexture = -1;
GLuint OpenGL::activeVao = -1;

void OpenGL::init() {
    OpenGL::initShapeVaos();
    OpenGL::initShaders();
}

void OpenGL::initShapeVaos() {
    OpenGL::initShapeVao(EShape::Cube, shapes::cube);
    OpenGL::initShapeVao(EShape::Floor, shapes::floor);
}

void OpenGL::initShaders() {
    OpenGL::createShader(EShaderType::Object, "src/vertex_shader.glsl", "src/fragment_shader.glsl");
    OpenGL::createShader(EShaderType::Shadow, "src/shadow_vertex_shader.glsl", "src/shadow_fragment_shader.glsl");
}

void OpenGL::initShapeVao(EShape shape, vector<GLfloat> vertices) {
    GLuint vao;
	glGenVertexArrays(1, &vao);
	OpenGL::bindVao(vao);

    GLuint vbo;
	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(GLfloat), vertices.data(), GL_STATIC_DRAW);

	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(6 * sizeof(float)));
    glEnableVertexAttribArray(2);

    OpenGL::vaos[shape] = vao;
    OpenGL::trianglesNum[shape] = vertices.size();
}

void OpenGL::drawVertices(EShape shape) {
    OpenGL::bindVao(OpenGL::vaos[shape]);
    glDrawArrays(GL_TRIANGLES, 0, OpenGL::trianglesNum[shape] / 8);
}

GLuint OpenGL::createShader(EShaderType shaderType, char *vertexShaderSource, char *fragmentShaderSource) {
    GLuint cachedProgramId = OpenGL::programs[shaderType];
    if (cachedProgramId) {
        return cachedProgramId;
    }

    GLuint vertexShaderId = glCreateShader(GL_VERTEX_SHADER);
    GLuint fragmentShaderId = glCreateShader(GL_FRAGMENT_SHADER);

    string vertexShaderCode;
    ifstream vertexShaderStream(vertexShaderSource, ios::in);

    if (vertexShaderStream.is_open()) {
        stringstream sstr;
        sstr << vertexShaderStream.rdbuf();
        vertexShaderCode = sstr.str();
        vertexShaderStream.close();
    } else {
        fprintf(stderr, "Error: can't open %s.", vertexShaderSource);
        exit(1);
    }

    string fragmentShaderCode;
    ifstream fragmentShaderStream(fragmentShaderSource, ios::in);

    if (fragmentShaderStream.is_open()) {
        stringstream sstr;
        sstr << fragmentShaderStream.rdbuf();
        fragmentShaderCode = sstr.str();
        fragmentShaderStream.close();
    } else {
        fprintf(stderr, "Error: can't open %s.", vertexShaderSource);
        exit(1);
    }

    GLint result = GL_FALSE;
    int infoLogLength;

    // printf("Compiling shader: %s\n", vertexShaderSource);
    const char *vertexSourcePointer = vertexShaderCode.c_str();
    glShaderSource(vertexShaderId, 1, &vertexSourcePointer, NULL);
    glCompileShader(vertexShaderId);

    glGetShaderiv(vertexShaderId, GL_COMPILE_STATUS, &result);
    glGetShaderiv(vertexShaderId, GL_INFO_LOG_LENGTH, &infoLogLength);
    if (infoLogLength > 0) {
        vector<char> vertexShaderErrorMessage(infoLogLength + 1);
        glGetShaderInfoLog(vertexShaderId, infoLogLength, NULL, &vertexShaderErrorMessage[0]);
        printf("%s\n", &vertexShaderErrorMessage[0]);
    }

    // printf("Compiling shader: %s\n", fragmentShaderSource);
    const char *fragmentSourcePointer = fragmentShaderCode.c_str();
    glShaderSource(fragmentShaderId, 1, &fragmentSourcePointer, NULL);
    glCompileShader(fragmentShaderId);

    glGetShaderiv(fragmentShaderId, GL_COMPILE_STATUS, &result);
    glGetShaderiv(fragmentShaderId, GL_INFO_LOG_LENGTH, &infoLogLength);
    if (infoLogLength > 0) {
        vector<char> fragmentShaderErrorMessage(infoLogLength + 1);
        glGetShaderInfoLog(fragmentShaderId, infoLogLength, NULL, &fragmentShaderErrorMessage[0]);
        printf("%s\n", &fragmentShaderErrorMessage[0]);
    }

    // printf("Linking program\n");
    GLuint programId = glCreateProgram();
    glAttachShader(programId, vertexShaderId);
    glAttachShader(programId, fragmentShaderId);
    glLinkProgram(programId);

    glGetProgramiv(programId, GL_LINK_STATUS, &result);
    glGetProgramiv(programId, GL_INFO_LOG_LENGTH, &infoLogLength);
    if (infoLogLength > 0) {
        vector<char> ProgramErrorMessage(infoLogLength + 1);
        glGetProgramInfoLog(programId, infoLogLength, NULL, &ProgramErrorMessage[0]);
        printf("%s\n", &ProgramErrorMessage[0]);
    }

    glDetachShader(programId, vertexShaderId);
    glDetachShader(programId, fragmentShaderId);

    glDeleteShader(vertexShaderId);
    glDeleteShader(fragmentShaderId);

    OpenGL::programs[shaderType] = programId;

    return programId;
}

void OpenGL::useShader(EShaderType shaderType) {
    GLuint id = OpenGL::programs[shaderType];
    if (id != OpenGL::activeProgram) {
        glUseProgram(id);
        OpenGL::activeProgram = id;
    }
}

void OpenGL::bindTexture(GLuint id) {
    if (id != OpenGL::activeTexture) {
        glBindTexture(GL_TEXTURE_2D, id);
        OpenGL::activeTexture = id;
    }
}

void OpenGL::bindVao(GLuint id) {
    if (id != OpenGL::activeVao) {
        glBindVertexArray(id);
        OpenGL::activeVao = id;
    }
}

void OpenGL::uniform4fv(string name, glm::mat4 matrix) {
    glUniformMatrix4fv(glGetUniformLocation(OpenGL::activeProgram, name.c_str()), 1, GL_FALSE, &matrix[0][0]);
}

void OpenGL::uniform4f(string name, glm::vec4 vector) {
    glUniform4f(glGetUniformLocation(OpenGL::activeProgram, name.c_str()), vector.x, vector.y, vector.z, vector.w);
}

void OpenGL::uniform1i(string name, int integer) {
    glUniform1i(glGetUniformLocation(OpenGL::activeProgram, name.c_str()), integer);
}