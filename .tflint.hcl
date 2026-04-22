tflint {
  required_version = ">= 0.61"
}

plugin "terraform" {
  enabled = true
}

plugin "aws" {
  enabled = true
  version = "0.45.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
