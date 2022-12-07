resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  enabled = true
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_lb.alb.dns_name
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false

      cookies {
        forward = "all"
      }
    }
  }
  origin {
    domain_name = aws_lb.alb.dns_name
    origin_id   = aws_lb.alb.dns_name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["SSLv3"]          # just selected one since the parameter is required
    }
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

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cloudfront_distribution.domain_name
}