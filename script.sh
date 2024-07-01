#!/bin/bash

show_help() {
    echo "Usage: $0 [OPTION]"
    echo "--date, -d       Show current date"
    echo "--logs [NUM], -l [NUM]  Create NUM log files (default: 100)"
    echo "--help, -h       Show this help message"
}

case "$1" in
    --date|-d)
        echo "$(date)"
        ;;
    --logs|-l)
        if [ -z "$2" ]; then
            count=100
        else
            count=$2
        fi
        for i in $(seq 1 $count); do
            echo "Log number $i, created by skrypt.sh on $(date)" > "log_${i}.txt"
        done
        ;;
    --help|-h)
        show_help
        ;;
    *)
        echo "Invalid option. Use --help or -h for help."
        ;;
esac
