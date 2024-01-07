resource "aws_wafv2_web_acl" "waf_acl" {
  count = var.create_waf ? 1 : 0
  name        = "${var.customer}-${var.environment}-${var.product}-waf_acl"
  description = "Example of a managed rule."
  scope       = var.waf_acl_scope

  default_action {
    allow {}
  }

  rule {
    name     = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "SizeRestrictions_QUERYSTRING"
        }

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "NoUserAgent_HEADER"
        }

        scope_down_statement {
          geo_match_statement {
            country_codes = ["US", "NL"]
          }
        }
      }
    }

    # token_domains = ["mywebsite.com", "myotherwebsite.com"]

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "friendly-rule-metric-name"
      sampled_requests_enabled   = false
    }
  }

  tags = {
    "Name" = "${var.customer}-${var.environment}-${var.product}-waf_acl",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "Request_id" = "${var.Request_id}"
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "friendly-metric-name"
    sampled_requests_enabled   = false
  }
}

# Associate the rules with the WebACL
resource "aws_wafv2_web_acl_association" "waf_acl_association" {
  count = var.create_waf ? 1 : 0
  resource_arn = var.alb_resource_arn
  web_acl_arn  = aws_wafv2_web_acl.waf_acl[count.index].arn
}
