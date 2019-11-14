# mongo-monster
This repo is my playground where I'm playing with MongoDB replica set in DigitalOcean Kubernetes cluster

To use scripts from this repo you must set terraform variables and env variables (in the future I'll merge it to same config).

### .env example:
```
MONGO_PASSWORD="mymegapass"
MONGO_ROOT_PASSWORD="mymegapassroot"
MONGO_USER=myuser
MONGO_DATABASE=mydb
```

### terraform.tfvars.json example:
```
{
    "do_token": "my_digital_ocean_api_token_#see_do_docs",
    "allowed_ips": [
        "123.123.123.123"
    ]
}
```