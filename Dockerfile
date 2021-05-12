from rostooling/setup-ros-docker:ubuntu-focal-ros-foxy-desktop-latest

copy src /ws/src
run rosdep update
run apt-get update
run rosdep install --from-paths /ws/src --ignore-src -y --rosdistro foxy
