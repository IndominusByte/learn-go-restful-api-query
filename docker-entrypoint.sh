#!/bin/sh
set -e

watchmedo shell-command \
    --patterns="*.py" \
    --ignore-directories \
    --drop \
    --command='python run.py' \
