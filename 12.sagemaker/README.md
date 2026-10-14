### AWS Sagemaker Setup
<hr>

+ Verify AWS CLI is configured or not
```
aws s3 ls
```

+ Get the default vpc id
```
aws ec2 describe-vpcs \
--filters "Name=isDefault,Values=true" \
--query "Vpcs[0].VpcId" \
--output text \
--region ap-south-1
```

+ Get the subnets of the vpc
```
aws ec2 describe-subnets \
--filters "Name=vpc-id,Values=vpc-0574674caca93e2cb" \
--query "Subnets[].SubnetId" \
--output text \
--region ap-south-1
```

+ Create role for domain
  <br/>
  
  > Create the role
  ```
  aws iam create-role \
  --role-name SageMakerDomainExecutionRole \
  --assume-role-policy-document file://trust.json
  ```
  <br/>
  
  > Attach sagemaker full policy
  ```
  aws iam attach-role-policy \
  --role-name SageMakerDomainExecutionRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonSageMakerFullAccess
  ```
  <br/>

  > Get the role arn
  ```
  aws iam get-role --role-name SageMakerDomainExecutionRole --query "Role.Arn" --output text
  ```
