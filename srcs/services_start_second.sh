source_folders=("nginx")
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

main()
{
  ((len--))

  if [ "$1" == 1 ]
  then
    i=-1
    while [ "$i" != "$len" ]
      do
       ((i++))
       kubectl_apply "$i"
      done
    exit
  fi
  i=-1

  while [ "$i" != "$len" ]
  do
    ((i++))
    docker_build "$i"
    kubectl_apply "$i"
  done
  kubectl get pods
}

main "$1"