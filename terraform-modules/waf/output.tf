output "waf_acl_arn" {
  value = aws_wafv2_web_acl.waf_acl.*.arn
}

output "waf_acl_id" {
  value = aws_wafv2_web_acl.waf_acl.*.id
}