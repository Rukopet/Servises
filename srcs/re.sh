po=$(kubectl get pods --no-headers=true | awk '{print $1}')
kubectl delete pods "$po"
#bash /Users/egums/Desktop/Servises/services_start_next.sh 1