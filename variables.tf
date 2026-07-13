variable "region" {

  description = "AWS region"

  type = string

  default = "eu-north-1"
}



variable "cluster_name" {

  description = "EKS cluster name"

  type = string

  default = "gitlab-terraform-eks"

}



variable "cluster_version" {

  description = "Kubernetes version"

  type = string

  default = "1.35"

}



variable "instance_type" {

  description = "Worker node instance type"

  type = string

  default = "t3.small"

}



variable "instance_count" {

  description = "Number of worker nodes"

  type = number

  default = 3

}



variable "agent_namespace" {

  description = "GitLab Agent namespace"

  type = string

  default = "gitlab-agent"

}



variable "agent_token" {

  description = "GitLab Agent token"

  type = string

  sensitive = true

}



variable "kas_address" {

  description = "GitLab KAS address"

  type = string

}