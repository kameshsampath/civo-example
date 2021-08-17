variable "gloo_clusterz" {
  type        = map(any)
  description = "Gloo Clusters"
}

variable gloo_name {
  type        = string
  description = "description"
}

variable gloo_region {
  type        = string
  description = "description"
}

variable gloo_num_nodes {
  type        = number
  description = "description"
}

variable gloo_role {
  type        = string
  description = "description"
}

variable gloo_apps {
  type        = list(string)
  description = "description"
}

variable gloo_target_nodes_size {
  type        = string
  description = "description"
}


data "civo_kubernetes_version" "stable" {
  filter {
    key    = "type"
    values = ["stable"]
  }
}

resource "civo_kubernetes_cluster" "gloo" {
  for_each = var.gloo_clusterz

  name               = "gloo-${var.gloo_name}"
  region             = var.gloo_region
  num_target_nodes   = var.gloo_num_nodes
  target_nodes_size  = var.gloo_target_nodes_size
  tags               = join(",", ["gloo",var.gloo_role])
  applications       = join(",", var.gloo_apps)
  kubernetes_version = element(data.civo_kubernetes_version.stable.versions, 0).version
}
