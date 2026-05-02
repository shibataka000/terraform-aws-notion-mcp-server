resource "aws_bedrockagentcore_agent_runtime" "main" {
  agent_runtime_name = "notion_mcp_server"
  role_arn           = aws_iam_role.bedrockagentcore_agent_runtime.arn

  agent_runtime_artifact {
    container_configuration {
      container_uri = var.container_uri
    }
  }

  network_configuration {
    network_mode = "PUBLIC"
  }
}
