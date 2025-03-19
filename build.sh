#!/usr/bin/env sh
colcon build \
  --merge-install \
  --event-handlers console_cohesion+ \
  --cmake-args \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    -DOPENGL_opengl_LIBRARY="/opt/mamba/envs/ros2/lib/libGL.so.1" \
    -DOPENGL_glx_LIBRARY="/opt/mamba/envs/ros2/lib/libGLX.so.0" \
    -DQT_HOST_PATH="/opt/mamba/envs/ros2" \
    -Dnanoflann_DIR="/opt/mamba/share/cmake/nanoflann" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1
