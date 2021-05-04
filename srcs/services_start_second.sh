source_folders=("nginx" "mysql" "phpmyadmin" "wordpress")
# dir with image

#build_name=("nginx_image")
## image name

len=${#source_folders[@]}

docker_build()
{
#  echo "docker build -t "${source_folders[$1]}/${build_name[$1]}" ."

  echo "docker build -t ${source_folders[$1]}_image ${source_folders[$1]}/"
  docker build -t "${source_folders[$1]}"_image "${source_folders[$1]}"/
}

kubectl_apply()
{
  echo "kubectl apply -f ${source_folders[$1]}/${source_folders[$1]}.yaml"
  kubectl apply -f "${source_folders[$1]}/${source_folders[$1]}.yaml"
}

re()
{
  kubectl delete deployments "${source_folders[$1]}-deploy"
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
  kubectl get pods
  kubectl describe pods
}

main "$1" "$2"