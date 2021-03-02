#!/bin/bash
uas=$(kubectl get pods -n default -o wide | grep 'uas' | awk '{print $1}');
kubectl exec -it $uas -n default -- bash -c 'cd /home/sipp/sipp-3.4.1 && sh shell/uas.sh'
