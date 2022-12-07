resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  enabled = true
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_lb.alb.id
    viewer_protocol_policy = "allow-all"
  }
  origin {
    domain_name = aws_lb.alb.dns_name
    origin_id   = aws_lb.alb.id
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

output "cloudfront_status" {
  value = aws_cloudfront_distribution.cloudfront_distribution.status
}