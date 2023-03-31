git submodule update --init
cd vulkan_helper/resources/shaders
glslangValidator -V fragmentShader.frag -o fragmentShader.spv
glslangValidator -V vertexShader.vert -o vertexShader.spv
cd ../..
mkdir build
cd build
cmake .. 
cmake --build .

cp -rf include ../../
cp -rf lib ../../
cd ..
cp -rf resources ../
mkdir ../target
mkdir ../zig-out/bin
cp -rf resources ../zig-out/bin/resources
cd ..
