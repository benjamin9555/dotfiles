#!/usr/bin/env bash

# neuroglancer
export PATH="$PATH:~/code/src/funlib.show.neuroglancer/scripts"

# disable hidden openmp and therefore numpy multiprocessing
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
