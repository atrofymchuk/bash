#!/bin/bash
find / -type f -mtime -5 -printf '%s %p\n' 2>/dev/null | sort -n |  tail -5 | sort -nr > ~/result.txt
