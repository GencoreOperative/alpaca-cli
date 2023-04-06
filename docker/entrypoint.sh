#!/bin/bash
# A simple script that will initiate the chat utility in a
# single use mode that might be suitable for command line
# interaction.

PROMPT="$@"

./chat --threads 8 --prompt "$PROMPT" 2>/dev/null