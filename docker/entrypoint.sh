#!/bin/bash

# Copyright 2023 GencoreOperative
# 
# Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License

# A simple script that will initiate the chat utility in a
# single use mode that might be suitable for command line
# interaction.

function half_cpus() {
    cpus=$(nproc)
    half=$((cpus / 4))
    if [[ $half -eq 0 ]]; then
        half=1
    fi
    echo $half
}

#CORES=$(half_cpus)
CORES=10
>&2  echo "CPUS used: $CORES"

# Output license reminder
>&2 echo "Alpaca is intended only for academic research and any commercial use is prohibited"
>&2 echo "Please see https://crfm.stanford.edu/2023/03/13/alpaca.html for more details"

./chat "$@" 2>/dev/null