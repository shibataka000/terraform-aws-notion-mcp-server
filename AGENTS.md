# Copilot Instructions

## Overview

This repository is a Terraform configuration (not a reusable module) that deploys a Notion MCP server on AWS using Bedrock AgentCore. It provisions three main AWS components:

- **ECR repository** – stores the container image (KMS-encrypted, immutable tags, scan-on-push enabled)
- **IAM role** – assumed by `bedrock-agentcore.amazonaws.com` with ECR pull permissions
- **Bedrock AgentCore Agent Runtime** – runs the container as an MCP server over the `MCP` protocol

## Commands

```bash
make init   # terraform init + tflint --init
make lint   # terraform validate + fmt check + tflint + trivy
make plan   # terraform plan
make apply  # terraform apply
make clean  # remove .terraform directory
```

Linting runs `terraform validate`, `terraform fmt -check -diff -recursive`, `tflint --recursive`, and `trivy config .` (trivy exits with code 1 on findings as configured in `trivy.yaml`).

## Key Conventions

**File layout** – Each AWS service gets its own `.tf` file (`ecr.tf`, `iam.tf`, `bedrockagentcore.tf`). Data sources for shared context live in `sts.tf` and `meta.tf`. `locals.tf` centralises the `local.name` value (`var.agent_runtime_name`) used as the name for all resources.

**Naming** – All resources use `local.name` (= `var.agent_runtime_name`) as their name/identifier. All resources accept `var.tags` and pass it directly as `tags`.

**Network mode** – `var.network_mode` is either `"PUBLIC"` or `"VPC"`. The `network_mode_config` block inside `bedrockagentcore.tf` uses a `dynamic` block that only appears when `network_mode == "VPC"`.

**GitHub Actions** – All `uses:` action references must include a pinned SHA digest comment (e.g., `# v4.0.0`). See existing workflows for the pattern.

**Provider version** – The AWS provider is pinned to an exact version in `terraform.tf`. Update it deliberately, not incidentally.

**Backend** – Remote state is stored in S3 (`sbtk-tfstate` bucket, `ap-northeast-1`) with S3 native locking (`use_lockfile = true`). No DynamoDB table is used.

**MCP server** – `.mcp.json` configures the HashiCorp Terraform MCP server (via Docker) for use in Copilot sessions.
