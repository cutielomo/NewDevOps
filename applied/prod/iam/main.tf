resource "aws_iam_user" "my_users" {
  for_each = local.users
  name = each.key
}

resource "aws_iam_user_policy_attachment" "my_users" {
  for_each = local.users
  user       = aws_iam_user.my_users[each.key].name
  policy_arn = each.value
}

resource "aws_iam_group" "my_groups" {
  for_each = local.managed_polices
  name = each.key
}

resource "aws_iam_group_policy_attachment" "my_gruops_attachment" {
  for_each = local.managed _polices
  group      = aws_iam_group.my_groups[each.key].name
  policy_arn = each.value
}

resource "aws_iam_group_policy" "my_group_inline_policy" {
  for_each = local.inline_polices
  name  = ${each.key}-policy
  group = aws_iam_group.my_groups[each.key].name
  policy = each.value
   }