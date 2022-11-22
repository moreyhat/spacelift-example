resource "spacelift_policy" "deny-public-bucket" {
    name = "Do not deploy public S3 bucket"
    body = file("${path.module}/rego/no-public-s3-bucket.rego")
    type="PLAN"
}

resource "spacelift_policy" "deny-ssh-full-open" {
    name = "Do not deploy SSH full open SG"
    body = file("${path.module}/rego/no-ssh-open.rego")
    type="PLAN"
}