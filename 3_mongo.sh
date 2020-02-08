kubectl create namespace mongo
helm install mongo stable/mongodb --values=mongo_replica.yaml --namespace=mongo --set mongodbRootPassword=$MONGO_ROOT_PASSWORD

