#!/usr/bin/env bash

#SBATCH --job-name="load docker image"
#SBATCH --time=01:00:00
#SBATCH --mem-bind=local
#SBATCH --nodes=1-1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-socket=1

DOCKER_IMAGE=$1

echo "-- Node $HOSTNAME"

# -- SET UP ENVIRONMENT (define flapy_docker_command)
echo "-- Preparing slurm node"
source prepare_slurm_node.sh || exit

echo "-- Cleaning podman"
./clean_podman.sh

echo "-- Loading image ${DOCKER_IMAGE}"
date -Iseconds
flapy_docker_command load -i "${DOCKER_IMAGE}"
date -Iseconds

echo "-- Echo podman info"
./echo_podman_info.sh

echo "-- Done!"