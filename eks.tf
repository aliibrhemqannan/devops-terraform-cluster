module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.37"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version


  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true


  enable_irsa = true

  enable_cluster_creator_admin_permissions = true


  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnets


  cluster_addons = {

    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }

  }


  eks_managed_node_groups = {

    default = {

      min_size     = 1
      max_size     = var.instance_count
      desired_size = var.instance_count


      instance_types = [
        var.instance_type
      ]

    }

  }

}