minikube delete
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
