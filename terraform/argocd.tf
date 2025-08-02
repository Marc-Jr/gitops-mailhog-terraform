provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  version    = "5.40.1"  # or latest stable

  values = [
    file("${path.module}/argocd-values.yaml")  # optional custom values
  ]
}


resource "kubernetes_manifest" "mailhog_app" {
  manifest = yamldecode(file("${path.module}/../k8s/app-mailhog.yaml"))
}
