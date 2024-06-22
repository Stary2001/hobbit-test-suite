#!/usr/bin/env bash
cp plan9-run.sh 9/run.sh
./vx32/src/9vx/9vx -g -r $(pwd)/9 -i /run.sh
