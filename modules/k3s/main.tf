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
  for_each = var.gloo_clusters

  name               = "gloo-${var.gloo_name}"
  region             = gloo_region
  num_target_nodes   = gloo_num_nodes
  target_nodes_size  = gloo_target_nodes_size
  tags               = join(",", ["gloo",gloo_role])
  applications       = join(",", gloo_apps)
  kubernetes_version = element(data.civo_kubernetes_version.stable.versions, 0).version
}