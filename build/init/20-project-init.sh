#!/bin/sh

set -e

if [ -e /.project-initialized ]; then
    exit 0
fi

touch /.project-initialized
