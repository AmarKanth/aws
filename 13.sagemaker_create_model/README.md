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
--default-user-settings "ExecutionRole=arn:aws:iam::058264205719:role/SageMakerDemoExecutionRole" \
--vpc-id vpc-0574674caca93e2cb \
--subnet-ids subnet-0165a7b3e371cf437 subnet-0f26fe0162c37dd07 subnet-077616ad27150 \
--app-network-access-type PublicInternetOnly
```

```
aws sagemaker create-user-profile \
--domain-id <DOMAIN-ID> \
--user-profile-name demo-user
```

+ Create jupyter nodebook and save the iris-model.pkl model file to s3
