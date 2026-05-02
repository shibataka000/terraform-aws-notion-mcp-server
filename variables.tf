variable "name" {
  type        = string
  description = "The name of the Notion MCP server."
  default     = "notion-mcp-server"
}

variable "container_uri" {
  type        = string
  description = "The URI of the container image for the Notion MCP server."
}
