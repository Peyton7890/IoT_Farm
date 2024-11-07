# Declare data sources for region and caller identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# Create Timestream records write policy
resource "aws_iam_policy" "db_policy" {
  name = "db-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "timestream:WriteRecords",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:timestream:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:database/${var.timestream_database_name}DB/table/main_table"
      },
      {
        Action = [
          "timestream:DescribeEndpoints",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Create the IAM role for Timestream records write
resource "aws_iam_role" "topic_role" {
  name               = "timestream_write"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "iot.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Attaching IAM policy to the Timestream role
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.topic_role.name
  policy_arn = aws_iam_policy.db_policy.arn
}
