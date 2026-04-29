resource "aws_bedrockagentcore_agent_runtime" "example" {
  agent_runtime_name = "example_agent_runtime"
  role_arn           = aws_iam_role.example.arn

  agent_runtime_artifact {
    container_configuration {
      container_uri = "${aws_ecr_repository.example.repository_url}:latest"
    }
  }

  network_configuration {
    network_mode = "PUBLIC"
  }
}
