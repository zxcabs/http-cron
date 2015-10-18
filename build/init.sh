#!/bin/sh

set -e

mv /build/init/20-project-init.sh /etc/my_init.d/20-project-init.sh

cd /app && npm run init
