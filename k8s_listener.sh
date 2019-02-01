#!/bin/bash
i=0
while true; do
    PODS=`kubectl get pods`
    HPA=`kubectl get hpa`
    NODE=`kubectl top node`
    POD=`kubectl top pod`
    clear && printf "\033c"
    echo "******************************************************************************"
    echo "                                    PODS                                      "
    echo "******************************************************************************"
    echo "$PODS"
    echo "********************************************************************************************************"
    echo "                                       Horizontal Pod Autoscaler                                        "
    echo "********************************************************************************************************"
    echo "$HPA"
    i=$((i + 1))
    echo $i
    sleep 2s
done
