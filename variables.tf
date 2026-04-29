variable "region" {
  description = "AWS region."
  type        = string
  default     = "ap-northeast-1"
}

variable "agent_runtime_name" {
  description = "Name of the Bedrock AgentCore Agent Runtime."
  type        = string
}

variable "container_uri" {
  description = "URI of the container image in Amazon ECR."
  type        = string
}

variable "network_mode" {
  description = "Network mode for the agent runtime. Valid values: PUBLIC, VPC."
  type        = string
  default     = "PUBLIC"

  validation {
    condition     = contains(["PUBLIC", "VPC"], var.network_mode)
    error_message = "network_mode must be PUBLIC or VPC."
  }
}

variable "subnet_ids" {
  description = "Subnet IDs for VPC network mode."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs for VPC network mode."
  type        = list(string)
  default     = []
}

variable "environment_variables" {
  description = "Map of environment variables to pass to the container."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Key-value map of resource tags."
  type        = map(string)
  default     = {}
}
