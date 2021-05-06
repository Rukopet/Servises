#!/bin/sh
nginx -g 'daemon off;'
pure-ftpd -j -Y 2 -p 50020:50020 -P __MINIKUBE_IP__