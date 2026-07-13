resource "helm_release" "gitlab_agent" {

  depends_on = [
    module.eks
  ]

  name = "gitlab-agent"

  repository = "https://charts.gitlab.io"

  chart = "gitlab-agent"

  namespace = var.agent_namespace

  create_namespace = true


  set = [
    {
      name  = "config.kasAddress"
      value = var.kas_address
    }
  ]


  set_sensitive = [
    {
      name  = "config.token"
      value = var.agent_token
    }
  ]

}