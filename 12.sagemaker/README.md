### AWS Sagemaker Setup

+ To check whether aws cli is setup and configured
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
