+ SageMaker does not deploy individual files. It expects a tar.gz file.

```
import tarfile

with tarfile.open("model.tar.gz", "w:gz") as tar:
    tar.add("iris-model.pkl")
    tar.add("inference.py")

print("model.tar.gz created")
```

```
import boto3

s3 = boto3.client("s3")
bucket_name = "my-sagemaker-demo-bucket-amar"
s3.upload_file("model.tar.gz", bucket_name, "model-artifacts/model.tar.gz")
print("Packaged model uploaded to S3")
```
