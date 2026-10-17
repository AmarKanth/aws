### AWS Sagemaker Create Model
<hr>

+ Create s3 bucket
```
aws s3 mb s3://my-sagemaker-demo-bucket
```

+ Setup Sagemaker
```
aws iam create-role \
--role-name SageMakerDemoExecutionRole \
--assume-role-policy-document file://trust.json
```

```
aws iam attach-role-policy \
--role-name SageMakerDemoExecutionRole \
--policy-arn arn:aws:iam::aws:policy/AmazonSageMakerFullAccess
```

```
aws iam attach-role-policy \
--role-name SageMakerDemoExecutionRole \
--policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```

```
aws ec2 describe-vpcs --filters Name=isDefault,Values=true \
--query "Vpcs[0].VpcId" --output text
```

```
aws ec2 describe-subnets --filters Name=vpc-id,Values=<VPC-ID> \
--query "Subnets[*].SubnetId" --output text
```

```
aws sagemaker create-domain \
--domain-name demo-domain \
--auth-mode IAM \
--default-user-settings "ExecutionRole=arn:aws:iam::<ACCOUNT-ID>:role/SageMakerDemoExecutionRole" \
--vpc-id <VPC-ID> \
--subnet-ids "<SUBNET-1>" "<SUBNET-2>" \
--app-network-access-type PublicInternetOnly
```

```
aws sagemaker create-user-profile \
--domain-id <DOMAIN-ID> \
--user-profile-name demo-user
```
