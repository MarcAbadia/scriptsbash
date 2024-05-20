#!/bin/bash

PASSWORD=${RANDOM}
echo "password con número random: ${RANDOM}"

PASSWORD=$(date +%s%N | sha256sum | head -c10)
echo "${PASSWORD}"