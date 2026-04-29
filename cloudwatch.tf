resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "/aws/vpc/flow-logs"
  retention_in_days = 7
  kms_key_id        = aws_kms_key.cloudwatch_logs.arn
}
