

acm_certificate_arn = "arn:aws:acm:ap-south-1:638773204626:certificate/3d030b9a-52f6-4b32-bd12-9c98b6894a45"

tags = {
  Environment = "production"
  Project     = "my-project"
}

alias = ["spectatr.gg"]
cloudfront_default_certificate = false
comment = "This is my CloudFront distribution."
default_root_object = "index.html"

custom_error_response = [
  {
    error_code            = 404
    error_caching_min_ttl = 300
    response_code         = 200
    response_page_path    = "/404.html"
  }
]

custom_origin_config = [
  {
    domain_name                = "example.com"
    origin_id                  = "customOrigin1"
    origin_path                = "/path"
    http_port                  = 80
    https_port                 = 443
    origin_keepalive_timeout   = 60
    origin_read_timeout        = 60
    origin_protocol_policy     = "https-only"
    origin_ssl_protocols       = ["TLSv1.2"]
    custom_header              = [
      {
        name  = "X-Custom-Header"
        value = "MyValue"
      }
    ]
  }
]



ordered_cache_behavior = [
  {
    path_pattern           = "/images/*"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "customOrigin1"
    compress               = true
    viewer_protocol_policy = "redirect-to-https"

    # Required forwarded values
    use_forwarded_values = true
    forwarded_values = {
      query_string = true
      cookies = {
        forward = "all"
      }
    }
  }
]

origin_group = [
  {
    origin_id    = "originGroup1"
    status_codes = [404, 500]
    member       = [
      {
        origin_id = "customOrigin1"
      }
    ]
  }
]

logging_config = [
  {
    bucket          = "my-logs-bucket"
    include_cookies = true
    prefix          = "cloudfront/"
  }
]

s3_origin_config = [
  {
    domain_name             = "fc-glacier-dev.s3.ap-south-1.amazonaws.com"
    origin_id               = "s3Origin1"
    origin_access_identity  = "origin-access-identity/cloudfront/E4NBLIJ7I1A8I"
    origin_path             = ""
  }
]

enable               = true
is_ipv6_enabled      = true
http_version         = "http2"
iam_certificate_id   = null
minimum_protocol_version = "TLSv1.2_2021"
price_class          = "PriceClass_All"
restriction_location = null
restriction_type     = "none"
retain_on_delete     = false
ssl_support_method   = "sni-only"
wait_for_deployment  = true
web_acl_id           = "9a6d78ca-0e09-45e2-a675-fa04fe465218"

allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
cached_methods  = ["GET", "HEAD"]
cache_policy_id = null
default_ttl     = 60
min_ttl         = 0
max_ttl         = 31536000
trusted_signers = []
trusted_key_groups = []
compress        = true
viewer_protocol_policy = "redirect-to-https"
realtime_log_config_arn = "arn:aws:cloudfront::638773204626:distribution/EDG7V5L6WD65N"

lambda_function_association = [
  {
    event_type   = "viewer-request"
    include_body = false
    lambda_arn   = "arn:aws:lambda:ap-south-1:638773204626:function:participation-listener"
  }
]

# Function association
function_association = [
  {
    event_type   = "viewer-response"
    function_arn = "arn:aws:cloudfront:us-east-1:123456789012:function:my-cloudfront-function"
  }
]

forward_query_string        = false
query_string_cache_keys     = []
forward_cookies             = "none"
forward_header_values       = []
target_origin_id            = "customOrigin1"