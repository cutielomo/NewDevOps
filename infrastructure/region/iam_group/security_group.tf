module "security" {
  source = "../../..//modules/group"

  group_name            = "security"
  region = "us east-1"
  policy_name           = "security-cloudtits-managed-policy"
  policy_description    = "cloudtits-security-policy"
  inline_policy_to_attach = data.aws_iam_policy_document.security_inline_policy.json
  managed_policy_to_attach = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]


}
data "aws_iam_policy_document" "security_inline_policy" {
  statement {
    sid = ""
    actions = [
      "cloudtrail:*",
      "cloudwatch:*"
    ]
    resources = ["*"]
  }

  statement {
    sid = ""
    actions = [
      "ec2:*",
      "s3:*"
    ]
     resources = ["*"]
  }
}
