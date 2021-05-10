minikube delete
bash srcs/install.sh
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube addons enable metrics-server
minikube addons enable metallb
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
cd srcs
bash services_start_second.sh
