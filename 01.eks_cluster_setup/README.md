### EKS Architecture Overview
- The goal in Kubernetes is usually to distribute everything across different availability zones.
- Usually, in traditional Kubernetes, a cluster consists of a master node, etcd, and worker nodes.
  However, in Amazon EKS, AWS manages the master node, etcd, and other cluster-level
  operations(control plane).
- kubectl connects directly to the control plane (AWS EKS), allowing us to interact with and manage
  the worker nodes.

### IAM user and permissions
Create additional policies required to manage eks cluster

EKS-Admin-policy:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:*"
            ],
            "Resource": "*"
        }
    ]
}
```

CloudFormation-Admin-policy:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudformation:*"
            ],
            "Resource": "*"
        }
    ]
}
```

Assign the following policies to your IAM user
- AmazonEC2FullAccess
- IAMFullAccess
- AmazonVPCFullAccess
- CloudFormation-Admin-policy
- EKS-Admin-policy  

### Prerequisites
- AWS CLI(configure with IAM user)
- eksctl
- kubectl

### Commands
```
eksctl create cluster -f eks-cluster.yaml

kubectl get nodes
eksctl get cluster

eksctl get nodegroup --cluster eks-cluster
eksctl scale nodegroup --cluster eks-cluster --nodes 5 --nodes-max 5 --name ng-1

eksctl delete cluster -f eks-cluster.yaml
```
