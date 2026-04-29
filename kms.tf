resource "aws_kms_key" "ecr" {
  description             = "KMS key for ECR repository encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}
