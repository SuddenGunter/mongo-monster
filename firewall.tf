
variable "allowed_ips" {}

resource "digitalocean_firewall" "only_home_allowed" {
  name = "only-home-access-allowed"
  tags = ["k8s:${digitalocean_kubernetes_cluster.mongo-monster.id}"]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.allowed_ips
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "all"
    source_addresses = var.allowed_ips
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "all"
    source_addresses = var.allowed_ips
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
