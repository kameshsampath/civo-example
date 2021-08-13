terraform {
  required_providers {

    civo = {
      source  = "civo/civo"
      version = "0.10.9"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.4.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.2.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

  }

  required_version = ">= 0.12"
}
