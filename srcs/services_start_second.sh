source_folders=("nginx" "mysql" "phpmyadmin" "wordpress" "metallb" "ftps" "influxdb" "grafana")
# dir with image

#build_name=("nginx_image")
## image name

len=${#source_folders[@]}

docker_build()
{
#  echo "docker build -t "${source_folders[$1]}/${build_name[$1]}" ."
if [ "${source_folders[$1]}" != metallb ]
then
  echo "docker build -t ${source_folders[$1]}_image ${source_folders[$1]}/"
  docker build -t "${source_folders[$1]}"_image "${source_folders[$1]}"/
fi
}

kubectl_apply()
{
  echo "kubectl apply -f ${source_folders[$1]}/${source_folders[$1]}.yaml"
  kubectl apply -f "${source_folders[$1]}/${source_folders[$1]}.yaml"
}

re()
{
  kubectl delete deployments "${source_folders[$1]}-deployment"
}

main()
{
  ((len--))

  if [ "$1" == re ]
  then
    ((i=-1))
    while [ "$i" != "$len" ]
    do
      ((i++))
      re "$i"
    done
  fi

  ((i=-1))

  if [ "$2" == ex ]
  then
    exit
  fi

  while [ "$i" != "$len" ]
  do
    ((i++))
    docker_build "$i"
    kubectl_apply "$i"
  done
  sleep 1
  kubectl describe pods
  kubectl get pods
}
eval $(minikube docker-env)
if [ "$1" == bd ]
then
  docker build -t "$2"_image "$2"
elif [ "$1" == yl ]
then
  kubectl apply -f "$2/$2.yaml"
elif [ "$1" == upd ]
then
  kubectl delete deployments "$2-deployment"
  docker build -t "$2"_image "$2"
  kubectl apply -f "$2/$2.yaml"
elif [ "$1" == delpod ]
then
  kubectl delete deployments "$2-deployment"
else 
  main "$1" "$2"
fi
