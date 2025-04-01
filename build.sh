#!/usr/bin/env sh
colcon build \
  --merge-install \
  --symlink-install \
  --event-handlers console_cohesion+ \
  --cmake-args \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -DCMAKE_INSTALL_PATH=/usr/include \
    -DBUILD_TESTS=OFF \
    -DBUILD_TESTS_PCL=OFF \
    -DBUILD_DEMO=OFF \
    -DBUILD_TOOLS=OFF \
    -DBUILD_WITH_TBB=OFF \
    -DGTSAM_WITH_TBB=OFF \
    -DGTSAM_USE_SYSTEM_EIGEN=ON \
    -DBUILD_WITH_OPENMP=ON \
    -DBUILD_WITH_CUDA=ON \
    -DBUILD_WITH_CUDA_MULTIARCH=ON \
    -DBUILD_WITH_VIEWER=OFF \
    -DBUILD_WITH_MARCH_NATIVE=OFF \
    $@

