provider "helm" {
  kubernetes {
    host = google_container_cluster.primary.endpoint

    client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
    client_key             = google_container_cluster.primary.master_auth.0.client_key
    cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  }
}

resource "helm_release" "dashboard" {
  name = "kubernetes-dashboard"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard/kubernetes-dashboard"
}
