# ROS2 Humble 개발환경 구축하기

## Micromamba 설치
```bash
# Micromamba Folder 생성
sudo mkdir /opt/mamba

# Micromamba Folder에 유저권한 부여
# Linux User
sudo chown 1000:1000 /opt/mamba
# MacOS User
sudo chown 501:20 /opt/mamba 

# Micromamba 설치
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
# 다음과 같이 입력
Micromamba binary folder? [~/.local/bin] ~/.local/bin
Init shell (bash/zsh)? [Y/n] n
Configure conda-forge? [Y/n] Y
Prefix location? [~/micromamba] /opt/mamba
```
## Micromamba 환경 구축
```bash
# ROS2 Humble Micromamba 환경 구축
micromamba create -n ros2 python=3.11 -c conda-forge -c robostack-staging ros-humble-desktop

# ROS2 Humble Micromamba 환경 활성화
micromamba activate ros2

# 기본 개발 툴체인 설치
micromamba install -c conda-forge compilers cmake pkg-config make ninja colcon-common-extensions catkin_tools rosdep
```

## Micromamba 환경 로드 및 ROS2 Humble 로드
- 새로운 터미널을 열거나 재실행시 해야함
```bash
micromamba activate ros2
source /opt/mamba/envs/ros2/setup.sh
```
- 해당 작업을 매번하기 어렵기 때문에 rc 스크립트 작성
```sh
# ~/.ros2rc 파일에 작성
export MAMBA_EXE=$HOME/.local/bin/micromamba
export MAMBA_ROOT_PREFIX=/opt/mamba
export ROSDEP_SOURCE_PATH=/opt/mamba/envs/ros2/etc/rosdep

$MAMBA_EXE shell hook --shell ${SHELL} --root-prefix $MAMBA_ROOT_PREFIX | source

micromamba activate ros2
source /opt/mamba/envs/ros2/setup.sh
```
- 다음과 같이 간단히 로드 가능
```bash
source ~/.ros2rc
```

## rosdep 사용하기

### rosdep 초기화
```bash
rosdep init
rosdep update
```

### rosdep으로 종속 패키지 검색 및 설치
```bash
# baqu4ws 위치로 이동
rosdep install --from-paths src --ignore-src
```
