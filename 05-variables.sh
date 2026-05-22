#!/bin/bash

# TIMESTAMP=$(date)

# echo "TIME : $TIMESTAMP"

START_TIME=$(date)

sleep 10

END_TIME=$(date)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in $TOTAL_TIME seconds"