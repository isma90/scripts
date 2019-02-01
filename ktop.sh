#!/bin/bash
i=0
while true; do
    NODE=`kubectl top node`
    POD=`kubectl top pod`
    clear && printf "\033c"
    echo "******************************************************************************"
    echo "                                   TOP NODE                                   "
    echo "******************************************************************************"
    echo "$NODE"
    echo "******************************************************************************"
    echo "                                   TOP PODS                                   "
    echo "******************************************************************************"
    echo "$POD"
    i=$((i + 1))
    echo $i
    sleep 2s
done