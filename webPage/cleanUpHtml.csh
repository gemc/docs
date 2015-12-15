#!/bin/csh -f

# Remove non github files
# This should be an alias

rm -rf  `git status -s | grep \?\? | awk '{print $2}'`


