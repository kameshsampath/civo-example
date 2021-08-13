gloo_clusters = {
  gm-cluster-1 : {
    region            = "LON1"
    target_nodes_size = "g3.k3s.large"
    num_nodes         = 1
    role              = "mesh"
    apps              = ["-Traefik"]
  }
}