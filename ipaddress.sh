#!/bin/bash
#fetch required data
opensips_server=$(kubectl get pods -n default -o wide | grep opensips | awk '{print $1}');
opensips_ip=$(kubectl get pods -n default -o wide | grep opensips | awk '{print $6}');
uac=$(kubectl get pods -n default -o wide | grep 'uac' | awk '{print $1}'); 
uac_ip=$(kubectl get pods -n default -o wide | grep 'uac' | awk '{print $6}');

#putting data in configuration
#sed -i "s/172.17.0.2/$uac/g" uac_config.yaml
sed -i "s/UACIP/$uac_ip/g" uas_config.yaml
sed -i "s/OPENSIPSIP/$opensips_ip/g" uas_config.yaml
