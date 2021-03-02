#!/bin/bash
uas=$(kubectl get pods -n default -o wide | grep 'uas' | awk '{print $1}');
kubectl exec  $uas  sh shell/uas.sh
