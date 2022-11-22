package spacelift
import future.keywords.in

# Policy for CloudFormation
cfn_any_public_buckets := regex.match("Public.+", input.cloudformation.changes[_].After.Properties.AccessControl)

# Policy for Pulumi
pulumi_any_public_buckets := regex.match("public.+", input.pulumi.steps[_].new.inputs.acl)

deny["The change includes Public S3 bucket"] {
  cfn_any_public_buckets
}

deny["The change includes Public S3 bucket"] {
  pulumi_any_public_buckets
}

sample { true }