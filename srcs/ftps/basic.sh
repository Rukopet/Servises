#!/bin/sh
groupadd ftpusers
useradd -g ftpusers -d /home/ftpusers -s /sbin/nologin ftpusers
pure-ftpd -j -p 21000:21000 -P __MINIKUBE_IP__