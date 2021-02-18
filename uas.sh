#!/bin/bash
kubectl exec -i $uas -n default -- bash -c "./sipp -sf uas_mod_orig.xml -rsa $opensips_ip:5060 -i $uas_ip -p 5080" ;
