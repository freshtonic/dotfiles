#/usr/bin/env bash

bash -c "printenv" | xargs -F= -L1 launchctl setenv 
