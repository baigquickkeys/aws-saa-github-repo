# AWS Solutions Architect Associate — Hands-On Labs

12 scenario-based labs covering the core AWS services for the SAA-C03 exam — built through the AWS Console, the AWS CLI, and AWS CloudFormation, with an architecture diagram and interview-style questions for each.

**Live diagrams & walkthroughs:** https://baigquickkeys.github.io/aws-saa-hands-on-labs/ *(enable GitHub Pages on `/docs` to activate this link)*


## Architecture

A request resolves through Route 53, hits the CloudFront edge cache, and lands on an Application Load Balancer — which sits behind security groups and spreads traffic over an Auto Scaling Group of EC2 instances across two AZs. Those instances read/write a private RDS database and static objects in S3. A separate Lambda path handles asynchronous work off an SQS queue. IAM roles reach every service that needs one; CloudWatch pulls metrics and logs from everything.

![Architecture diagram](docs/architecture.svg)

## Labs

| # | Service | What it covers | Console | CLI | CloudFormation |
|---|---|---|---|---|---|
| 1 | [IAM](labs/01-iam/) | Least-privilege groups, tag-scoped policy, EC2 role | ✅ | ✅ | ✅ |
| 2 | [EC2](labs/02-ec2/) | Launch template, instance profile, AMI | ✅ | ✅ | ✅ |
| 3 | [S3](labs/03-s3/) | Versioning, encryption, lifecycle, static site | ✅ | ✅ | ✅ |
| 4 | [VPC](labs/04-vpc/) | Public/private subnets, IGW, S3 gateway endpoint | ✅ | ✅ | ✅ |
| 5 | [Security Groups](labs/05-security-groups/) | web-sg / db-sg reference rule | ✅ | ✅ | ✅ |
| 6 | [Load Balancer](labs/06-load-balancer/) | ALB, target group, health checks | ✅ | ✅ | ✅ |
| 7 | [Auto Scaling](labs/07-auto-scaling/) | Target tracking on CPU | ✅ | ✅ | ✅ |
| 8 | [RDS](labs/08-rds/) | Multi-AZ, snapshot/restore | ✅ | ✅ | ✅ |
| 9 | [Lambda](labs/09-lambda/) | SQS-triggered function, DLQ | ✅ | ✅ | ✅ |
| 10 | [CloudWatch](labs/10-cloudwatch/) | Alarms, log metric filters, SNS | ✅ | ✅ | ✅ |
| 11 | [Route 53](labs/11-route53/) | Failover routing + health checks | ✅ | ✅ | ✅ |
| 12 | [CloudFront](labs/12-cloudfront/) | Private origin via OAC | ✅ | ✅ | ✅ |

## Why this repo

Built while preparing for the AWS Certified Solutions Architect – Associate exam. Each lab is deliberately scenario-driven rather than a feature tour — the goal was to understand *why* a service choice is correct for a given constraint (RTO/RPO, cost, security), not just how to click through a console.

## Stack

AWS (IAM, EC2, S3, VPC, ELBv2, Auto Scaling, RDS, Lambda, SQS, DynamoDB, CloudWatch, Route 53, CloudFront) · AWS CLI · AWS CloudFormation

## License

MIT — see [LICENSE](LICENSE).
