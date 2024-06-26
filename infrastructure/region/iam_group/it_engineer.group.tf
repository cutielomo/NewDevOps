module "it_engineer" {
  source = "../../..//modules/group"

  group_name = "it_engineer"
  region = "us east-1"
  policy_name = "it_engineer-cloudtits-managed-polices"
  policy_description = "cloudtits-it_engineer-polices"
  inline_policy_to_attach = data.aws_iam_policy_document.it_engineer_inline_policy.json
  managed_policy_to_attach = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]


}
data "aws_iam_policy_document" "it_engineer_inline_policy" {
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
