#!/bin/bash
opensips_server=$(kubectl get pods -n default -o wide | grep opensips | awk '{print $1}');
opensips_ip=$(kubectl get pods -n default -o wide | grep opensips | awk '{print $6}');
uac=$(kubectl get pods -n default -o wide | grep 'uac' | awk '{print $1}'); 
uac_ip=$(kubectl get pods -n default -o wide | grep 'uac' | awk '{print $6}');

sip=$opensips_ip
uac=$uac_ip

sed -i "s/172.17.0.2/$uac/g" uac_config.yaml
sed -i "s/172.17.0.2/$uac/g" uas_config.yaml
