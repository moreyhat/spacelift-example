package spacelift

changes := input.cloudformation.changes

ssh_full_open {
  some i, j
  changes[i].After.Properties.SecurityGroupIngress[j].FromPort <= 22
  changes[i].After.Properties.SecurityGroupIngress[j].ToPort >= 22
  changes[i].After.Properties.SecurityGroupIngress[j].CidrIp == "0.0.0.0/0"
}

deny["SSH full open"] {
	ssh_full_open
}

sample { true }