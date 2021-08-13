variable "api_token" {
  type        = string
  description = "The Civo API token"
}

# gloo clusters
variable "gloo_clusters" {
  description = "Gloo Clusters"
  type        = map(any)
  default = {
    gloo : {
      region            = "LON1"
      target_nodes_size = "g3.k3s.large"
      num_nodes         = 1
      role              = "management"
      apps              = ["-Traefik"]
    }
  }
}