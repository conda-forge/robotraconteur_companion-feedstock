#!/bin/sh

set -e

mkdir -p build2
cd build2

if [[ "$CONDA_BUILD_CROSS_COMPILATION" = "1" ]]; then
  export CMAKE_CROSS_ARGS=-DRobotRaconteurGen_EXECUTABLE=${BUILD_PREFIX}/bin/RobotRaconteurGen
fi

cmake \
  -DBUILD_SHARED_LIBS:BOOL=ON \
  -DBUILD_TESTING:BOOL=OFF -DROBOTRACONTEUR_COMPANION_SOVERSION_MAJOR_ONLY=ON \
  ${CMAKE_ARGS} ${CMAKE_CROSS_ARGS} \
  ..

cmake --build . --config Release -- -j$CPU_COUNT
cmake --build . --config Release --target install
