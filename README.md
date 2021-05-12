# Nifty Simulation Testbed

A top level workspace and development environment for a nifty Neato simulation workflow.

The workflows here prescribe a Docker-based development environment.
To work on bare metal instead, you'll need to go follow the instructions for installing ROS 2 and Gazebo, then copy what `Dockerfile` does manually.

## Prerequisites

* Assuming Linux host machine
* Docker must be installed
* Python3 & pip must be installed
* There are _no other_ prerequisites

## Setting up development environment

Invoking the following script will install the few local dependencies needed, check out the application sources, then build the development environment Docker image.

```
./setup-development-environment
```

## Building the application

Start the dev environment with

```
./start-dev-container
```

This starts and drops into a Docker container named `neato-dev`.
The local sources are mounted into the container at `/ws` - so you can edit on the host machine but build in the controlled container.

```
source /opt/ros/foxy/setup.bash
colcon build --symlink-install
```

## Starting new dev shells

While testing out the application, you may want multiple shells in order to, for example, publish messages with the CLI tools (`ros2 topic pub`).

In a new shell:

```
docker exec -it neato-dev /bin/bash
# in the container, source the built workspace (and recursively the global ROS installation)
source install/setup.bash
```

## Usage examples


Starting the simulation (this may take a while the first time you launch it in a fresh container - subsequent launches in the same container are much faster)

```
ros2 launch neato_gazebo neato_world.launch.py
```


NOTE: you may see some output like the following. It is _not a problem_, the application should still work fine.

```
[gazebo-1] libGL error: MESA-LOADER: failed to retrieve device information
[gazebo-1] libGL error: Version 4 or later of flush extension not found
[gazebo-1] libGL error: failed to load driver: i915
[gazebo-1] libGL error: failed to open /dev/dri/card0: No such file or directory
[gazebo-1] libGL error: failed to load driver: i965
```
