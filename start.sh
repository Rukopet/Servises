minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metrics-server
minikube addons enable metallb
eval $(minikube docker-env)
cd srcs
bash services_start_second.sh
