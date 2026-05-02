# Copilot Instructions

## Overview

This repository contains a Terraform module to deploy a Notion MCP server on AWS.

## Commands

```bash
make init    # terraform init + tflint --init
make lint    # terraform validate + fmt check + tflint + trivy
make plan    # terraform plan
make apply   # terraform apply
make clean   # remove .terraform directory
```

## Architecture

All Terraform configuration lives in the root directory (no modules subdirectory). Files are organized by concern:

| File           | Purpose                                     |
| -------------- | ------------------------------------------- |
| `terraform.tf` | Required Terraform version                  |
| `backend.tf`   | State backend (S3, currently commented out) |
| `providers.tf` | Provider configuration                      |
| `variables.tf` | Input variables                             |
| `locals.tf`    | Local values                                |
| `main.tf`      | Root resources                              |
| `outputs.tf`   | Output values                               |

Resources and data sources are split into **per-AWS-service files** (e.g., `ecs.tf`, `iam.tf`, `secretsmanager.tf`) rather than grouped into a single `main.tf`.

## Conventions

- Follow the [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/style), including [file naming conventions](https://developer.hashicorp.com/terraform/language/style#file-names).
- Create a separate `.tf` file per AWS service for resources and data sources.
- `*.tfvars` files are gitignored — do not commit variable values.
- `trivy.yaml` sets `exit-code: 1`, so any Trivy finding fails the lint pipeline.
- tflint uses the `aws` ruleset (`tflint-ruleset-aws` v0.45.0) — ensure AWS resource arguments are valid per the ruleset.
- GitHub Actions workflow action references use pinned commit SHAs with a version comment (e.g., `actions/checkout@<sha> # v6.0.2`).
