#ifndef RESOURCE_MANAGER_H
#define RESOURCE_MANAGER_H

#include <map>

#include <glm/glm.hpp>

#include "Texture.hpp"

using namespace std;


class ResourceManager {
    private:
        static map<char*, Texture*> textures;

    public:
        static void loadTexture(char* textureSource);
        static Texture* getTexture(char* textureSource);
};

#endif