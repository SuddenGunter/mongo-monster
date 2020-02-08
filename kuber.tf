resource "digitalocean_kubernetes_cluster" "mongo-monster" {
  name   = "mongo-monster"
  region = "ams3"
  // Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.16.2-do.0"
  tags    = ["mongo-monster"]

  node_pool {
    name       = "worker"
    size       = "s-2vcpu-4gb"
    node_count = 3
    tags       = ["mongo-monster"]
  }
}

provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.mongo-monster.endpoint
  token = digitalocean_kubernetes_cluster.mongo-monster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.mongo-monster.kube_config[0].cluster_ca_certificate
  )
}
