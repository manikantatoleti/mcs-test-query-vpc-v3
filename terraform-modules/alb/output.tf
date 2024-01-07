output "alb_id" {
  value = "${aws_lb.alb_1.id}"
}

output "alb_dns_name" {
  value = "${aws_lb.alb_1.dns_name}"
}

output "alb_arn" {
  value = "${aws_lb.alb_1.arn}"
}

output "alb_listener_id" {
  value = "${aws_lb_listener.alb_listener_1.id}"
}

output "target_group_arn" {
  value = aws_lb_target_group.target_group_1.arn
}

output "listener_rule_id" {
  value = "${aws_lb_listener_rule.rule_1.id}"
}