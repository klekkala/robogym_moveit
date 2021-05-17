#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zhhm/robogym_ws/src/moveit/moveit_commander"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zhhm/robogym_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zhhm/robogym_ws/install/lib/python2.7/dist-packages:/home/zhhm/robogym_ws/build/moveit_commander/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zhhm/robogym_ws/build/moveit_commander" \
    "/usr/bin/python2" \
    "/home/zhhm/robogym_ws/src/moveit/moveit_commander/setup.py" \
     \
    build --build-base "/home/zhhm/robogym_ws/build/moveit_commander" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/zhhm/robogym_ws/install" --install-scripts="/home/zhhm/robogym_ws/install/bin"
