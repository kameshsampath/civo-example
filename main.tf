provider "civo" {
  token = var.api_token
}

# uncomment this to make this and command module block
# see terrform init go through 

# data "civo_kubernetes_version" "stable" {
#   filter {
#     key    = "type"
#     values = ["stable"]
#   }
# }

# resource "civo_kubernetes_cluster" "gloo" {
#   for_each = var.gloo_clusters

#   name               = "gloo-${each.key}"
#   region             = each.value.region
#   num_target_nodes   = each.value.num_nodes
#   target_nodes_size  = each.value.target_nodes_size
#   tags               = join(",", ["gloo", each.value.role])
#   applications       = join(",", each.value.apps)
#   kubernetes_version = element(data.civo_kubernetes_version.stable.versions, 0).version
# }

module "k3s" {

  source = "./modules/k3s"

  for_each = var.gloo_clusters

  gloo_name              = "gloo-${each.key}"
  gloo_region            = each.value.region
  gloo_num_nodes         = each.value.num_nodes
  gloo_target_nodes_size = each.value.target_nodes_size
  gloo_role              = each.value.role
  # applications           = each.value.apps
  gloo_apps              = []
  gloo_clusterz          = var.gloo_clusters
}
