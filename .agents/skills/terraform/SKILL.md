---
name: terraform
description: Terraformに関するコーディング規約です。
allowed-tools: Bash(make lint)
---

# Terraform

## Style guide

- https://developer.hashicorp.com/terraform/language/style に従ってください。

## File names

- https://developer.hashicorp.com/terraform/language/style#file-names に従ってください。
- リソース・データソースはAWSサービス単位でファイルを作成してください。

## Linting

```bash
make lint
```
