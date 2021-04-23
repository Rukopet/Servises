#!/bin/bash
# curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
cd ~
#brew install minikube &&
rm -rf .minikube && mkdir .minikube &&
mv .minikube ./goinfre &&
ln -s ./goinfre/.minikube .minikube
cd ~/Desktop/ft_services
#./setup.sh
# minikube addons enable metallb