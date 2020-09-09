#!/bin/bash

echo "$@"

if [ -z "$@" ]; then
  export PATH=/tools/anaconda3/bin:${PATH}
  source activate myenv
  jupyter notebook --no-browser --ip=0.0.0.0
else
  bash -c "$@"
fi
