git submodule update --init
cd vulkan_helper\resources\shaders
glslangValidator -V fragmentShader.frag -o fragmentShader.spv
glslangValidator -V vertexShader.vert -o vertexShader.spv
cd ..\..
mkdir build
cd build
cmake .. -G"MinGW Makefiles" -DVH_BUILD_TESTS=OFF -DVH_NO_NATIVE_INITS=ON
cmake --build . --config Debug

xcopy include ..\..\include /i /s /y
xcopy lib ..\..\lib /i /s /y
cd ..
xcopy resources ..\resources /i /s /y
mkdir ..\zig-out\bin
xcopy resources ..\zig-out\bin\resources /i /s /y
cd ..

7z x glfw-3.3.8.zip
if %errorlevel% neq 0 endlocal & exit /b %errorlevel%
cd glfw-3.3.8
mkdir build
cd build
cmake .. -G"MinGW Makefiles" -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_DOCS=OFF -DGLFW_INSTALL=OFF -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
cmake --build . --config Debug
xcopy ..\include\GLFW ..\..\include\GLFW /i /s
copy src\libglfw3.a ..\..\lib\
for /r %%a in (*.pdb) do @copy /y "%%a" ..\..\zig-out\bin
cd ..\..
rmdir /Q /S glfw-3.3.8
