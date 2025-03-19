# ROS2 Humble 개발환경에서 빌드하기

## build.sh 실행
```bash
./build.sh
```

## Trouble Shooting
- 실행 권한이 없다고 나올 시
```bash
chmod +x ./build.sh
```

- 실행 파일을 찾을 수 없다고 나올 시
[WORKSPACE.md](WORKSPACE.md)의 환경 구축 부분을 읽을 것
```
micromamba install -c conda-forge compilers cmake pkg-config make ninja colcon-common-extensions catkin_tools rosdep
```

- "Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY OPENGL_glx_LIBRARY)" 또는 "Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY OPENGL_glx_LIBRARY OpenGL)" 에러가 나올 시
```bash
sudo apt-get install libgl1-mesa-dev
```
build.sh파일에 cmake args에 다음 추가하기
```bash
    -DOPENGL_opengl_LIBRARY="/opt/mamba/envs/ros2/lib/libGL.so.1" \
    -DOPENGL_glx_LIBRARY="/opt/mamba/envs/ros2/lib/libGLX.so.0" \
```
- Nanoflann이 없다고 나올 시
build.sh파일에 cmake args에 다음 추가하기
```bash
    -Dnanoflann_DIR="/opt/mamba/share/cmake/nanoflann" \
```
