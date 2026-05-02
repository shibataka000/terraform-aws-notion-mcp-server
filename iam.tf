data "aws_iam_policy_document" "bedrockagentcore_assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["bedrock-agentcore.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "bedrockagentcore_agent_runtime" {
  statement {
    actions   = ["ecr:GetAuthorizationToken"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    actions = [
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer"
    ]
    effect    = "Allow"
    resources = [var.container_uri]
  }
}

resource "aws_iam_role" "bedrockagentcore_agent_runtime" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.bedrockagentcore_assume_role_policy.json
}

resource "aws_iam_policy" "bedrockagentcore_agent_runtime" {
  name   = var.name
  policy = data.aws_iam_policy_document.bedrockagentcore_agent_runtime.json
}

resource "aws_iam_role_policy_attachment" "bedrockagentcore_agent_runtime" {
  role       = aws_iam_role.bedrockagentcore_agent_runtime.name
  policy_arn = aws_iam_policy.bedrockagentcore_agent_runtime.arn
}
