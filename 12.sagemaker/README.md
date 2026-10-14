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
