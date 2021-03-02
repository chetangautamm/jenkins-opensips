#!/bin/bash
uas=$(kubectl get pods -n default -o wide | grep 'uas' | awk '{print $1}');
kubectl exec  $uas  sh /home/sipp/sipp-3.4.1/shell/uas.sh
