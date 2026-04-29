resource "aws_bedrockagentcore_agent_runtime" "this" {
  agent_runtime_name    = local.name
  role_arn              = aws_iam_role.this.arn
  environment_variables = var.environment_variables

  agent_runtime_artifact {
    container_configuration {
      container_uri = "${aws_ecr_repository.this.repository_url}:${var.image_tag}"
    }
  }

  network_configuration {
    network_mode = var.network_mode

    dynamic "network_mode_config" {
      for_each = var.network_mode == "VPC" ? [1] : []
      content {
        subnets         = var.subnet_ids
        security_groups = var.security_group_ids
      }
    }
  }

  protocol_configuration {
    server_protocol = "MCP"
  }
}
