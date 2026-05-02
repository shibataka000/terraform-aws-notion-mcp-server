terraform {
  backend "s3" {
    bucket       = "sbtk-tfstate"
    key          = "terraform-aws-notion-mcp-server"
    region       = "ap-northeast-1"
    use_lockfile = true
  }
}
