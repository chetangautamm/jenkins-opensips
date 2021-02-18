#!/bin/bash
kubectl exec -i $uac -n default -- bash -c "./sipp -sf uac_mod.xml $opensips_ip:5060 -trace_screen -s chetan -i $uac_ip -p 5065  -m 100 -r 10 -rp 1000" 
