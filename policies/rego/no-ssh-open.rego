package spacelift

cfn_changes := input.cloudformation.changes

cfn_ssh_full_open {
  some i, j
  cfn_changes[i].After.Properties.SecurityGroupIngress[j].FromPort <= 22
  cfn_changes[i].After.Properties.SecurityGroupIngress[j].ToPort >= 22
  cfn_changes[i].After.Properties.SecurityGroupIngress[j].CidrIp == "0.0.0.0/0"
}

pulumi_steps = input.pulumi.steps
pulumi_ssh_full_open {
  some k, l
  pulumi_steps[k].new.inputs.ingress[l].fromPort <= 22
  pulumi_steps[k].new.inputs.ingress[l].toPort >= 22
  pulumi_steps[k].new.inputs.ingress[l].cidrBlocks[_] == "0.0.0.0/0"
}

deny["SSH full open"] {
	cfn_ssh_full_open
}

deny["SSH full open"] {
	pulumi_ssh_full_open
}

sample { true }