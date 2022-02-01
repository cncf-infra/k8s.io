

# Display the entire created ECR resource

output "caleb-ecrpublic-k8s-test1" {
  value = aws_ecrpublic_repository.caleb-ecrpublic-k8s-test1
}
output "caleb-ecr-k8s-test1" {
  value = aws_ecr_repository.caleb-ecr-k8s-test1
}
