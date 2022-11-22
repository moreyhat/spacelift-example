package spacelift
import future.keywords.in

any_public_buckets := regex.match("Public.+", input.cloudformation.changes[_].After.Properties.AccessControl)

deny["The change includes Public S3 bucket"] {
  any_public_buckets
}

sample { true }