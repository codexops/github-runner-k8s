provider "aws" {
  region = var.region
}
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        data.aws_eks_cluster.cluster.name,
      ]
    }
  }
}
provider "kubectl" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name,
    ]
  }
}


# # gcloud compute disks create task-disk \
# #     --source-snapshot snapshot-vm \
# #     --replica-zones = us-east1,us-west1 \
# #     --project PROJECT

# # gcloud compute snapshots create hello-ji \
# #     --source-disk vm \
# #     --source-disk-region=us-east1
# gcloud compute snapshots create snapshots \
#     --source-disk vm \
#     --source-disk-region=us-east1

#     gcloud config set project "project-2"
# gcloud compute instances create vm \
#     --image image \
#     --image-project "task-project"
# 470786398219@cloudservices.gserviceaccount.com
