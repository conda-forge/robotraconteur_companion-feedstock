@echo off

md build2
cd build2
if %errorlevel% neq 0 exit /b %errorlevel%
cmake -GNinja ^
  -DBUILD_SHARED_LIBS:BOOL=ON ^
  -DBUILD_TESTING:BOOL=OFF ^
  -DROBOTRACONTEUR_COMPANION_SOVERSION_MAJOR_ONLY=ON ^
  %CMAKE_ARGS% ^
  ..
if %errorlevel% neq 0 exit /b %errorlevel%
cmake --build . --config Release -j 4
if %errorlevel% neq 0 exit /b %errorlevel%
cmake --build . --config Release --target install
