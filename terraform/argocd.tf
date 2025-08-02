resource "kubernetes_manifest" "mailhog_app" {
  manifest = yamldecode(file("${path.module}/../k8s/app-mailhog.yaml"))
}
