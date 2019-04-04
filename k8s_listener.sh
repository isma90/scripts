#!/bin/bash

while getopts ":n:" opt; do
  case $opt in
    n)
        namespace="$OPTARG"
        echo "namespace " $namespace
        PODS=`kubectl get pods --namespace $namespace`
        NODE=`kubectl top node`
        POD=`kubectl top pod --namespace $namespace`
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


function getMetrics () {
    if [ -z ${namespace+x} ]; then
        PODS=`kubectl get pods --namespace default`
        NODE=`kubectl top node`
        POD=`kubectl top pod --namespace default`
    fi    
}

i=0
while true; do
    getMetrics
    clear && printf "\033c"
    echo "******************************************************************************"
    echo "                                    PODS                                      "
    echo "******************************************************************************"
    echo "$PODS"
    echo "********************************************************************************************************"
    echo "                                       TOP POD                                       "
    echo "********************************************************************************************************"
    echo "$POD"
    echo "********************************************************************************************************"
    echo "                                       TOP NODE                                       "
    echo "********************************************************************************************************"
    echo "$NODE"
    i=$((i + 1))
    echo $i
    sleep 5s
done
