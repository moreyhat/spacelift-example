package spacelift
import future.keywords.in

any_public_buckets := true if {
  some change in input.cloudformation.changes
  change.After.Properties.AccessControl == "PublicRead"
}

deny["The change includes Public S3 bucket"] {
  any_public_buckets
}

sample { true }