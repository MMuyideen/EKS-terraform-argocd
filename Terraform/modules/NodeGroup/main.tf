# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

resource "aws_eks_node_group" "node_group" {

  cluster_name    = var.EKS_CLUSTER_NAME                 # Name of the EKS Cluster
  node_group_name = "${var.EKS_CLUSTER_NAME}-node_group" # Name of the EKS Node Group.
  node_role_arn   = var.NODE_GROUP_ARN                   # ARN of the IAM Role that provides permissions for the EKS Node Group.

  # Identifiers of EC2 Subnets to associate with the EKS Node Group. 
  # These subnets must have the following resource tag: kubernetes.io/cluster/EKS_CLUSTER_NAME 

  subnet_ids = [
    var.PRI_SUB3_ID,
    var.PRI_SUB4_ID
  ]

  # Configuration block
  scaling_config {
    desired_size = 2 # Required number of worker nodes
    max_size     = 2 # Maximum number of worker nodes
    min_size     = 2 # Minimum number of worker nodes
  }

  ami_type      = "AL2_x86_64" # AMI type associated with the EKS Node Group
  capacity_type = "ON_DEMAND"  # capacity type associated with the EKS Node Group
  disk_size     = 20           # Disk size in GB for worker nodes

  
  force_update_version = false # Force version update if existing pods are unable to be drained due to a pod disruption budget issue
  instance_types = ["t3.small"] # Instance type associated with the EKS Node Group

  labels = {
    role = "${var.EKS_CLUSTER_NAME}-Node-group-role",
    name = "${var.EKS_CLUSTER_NAME}-node_group"
  }

  version = "1.31" # Kubernetes version for the EKS Node Group
}
