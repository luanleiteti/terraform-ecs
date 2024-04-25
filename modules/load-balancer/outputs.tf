output "main_alb" {
  value = aws_lb.main_alb
}

output "main_alb_listener_http" {
  value = aws_lb_listener.main_alb_listener_http
}

output "main_alb_listener_https" {
  value = aws_lb_listener.main_alb_listener_https
}

output "main_alb_listener_https_green" {
  value = aws_lb_listener.main_alb_listener_https_green
}

output "main_alb_bucket_logs" {
  value = aws_s3_bucket.main_alb_bucket_logs
}