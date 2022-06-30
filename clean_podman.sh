#!/usr/bin/env bash

echo "-- (Un)setting global variables"
unset XDG_RUNTIME_DIR
unset XDG_CONFIG_HOME
export HOME=$PODMAN_HOME

echo "-- Removing containers"
podman --root "${LOCAL_PODMAN_ROOT}" rm -v --all

echo "-- Removing images"
podman --root "${LOCAL_PODMAN_ROOT}" rmi -v --all
