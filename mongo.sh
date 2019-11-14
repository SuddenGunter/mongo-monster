set -a; . ./.env; set +a

helm install mongomonster \
  --set mongodbRootPassword=$MONGO_ROOT_PASSWORD,mongodbUsername=$MONGO_USER,mongodbPassword=$MONGO_PASSWORD,mongodbDatabase=$MONGO_DATABASE \
    stable/mongodb