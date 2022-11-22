import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import * as awsx from "@pulumi/awsx";

const securityGroup = new aws.ec2.SecurityGroup("security-group", {
    ingress: [{
        description: "SSH full open",
        fromPort: 22,
        toPort: 22,
        protocol: "tcp",
        cidrBlocks: [
            "0.0.0.0/0"
        ]
    }],
    egress: [{
        fromPort: 0,
        toPort: 0,
        protocol: "-1",
        cidrBlocks: ["0.0.0.0/0"],
        ipv6CidrBlocks: ["::/0"],
    }],
    tags: {
        Name: "ssh-full-open"
    }
});

const instance = new aws.ec2.Instance("instance", {
    ami: "ami-094125af156557ca2",
    instanceType: "t3.nano",
    tags: {
        Name: "Spacelift-test"
    },
    vpcSecurityGroupIds: [
        securityGroup.id
    ]
});