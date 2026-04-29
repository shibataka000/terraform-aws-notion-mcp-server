output "agent_runtime_arn" {
  description = "ARN of the Bedrock AgentCore Agent Runtime."
  value       = aws_bedrockagentcore_agent_runtime.this.agent_runtime_arn
}

output "agent_runtime_id" {
  description = "Unique identifier of the Bedrock AgentCore Agent Runtime."
  value       = aws_bedrockagentcore_agent_runtime.this.agent_runtime_id
}

output "agent_runtime_version" {
  description = "Version of the Bedrock AgentCore Agent Runtime."
  value       = aws_bedrockagentcore_agent_runtime.this.agent_runtime_version
}

output "role_arn" {
  description = "ARN of the IAM role used by the Agent Runtime."
  value       = aws_iam_role.this.arn
}
