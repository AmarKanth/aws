```
Pod (with serviceAccount) ---> Makes PVC claim
  |
  v
CSI Driver sees PVC --> Needs to call AWS EC2 API
  |
  v
Uses serviceAccount token --> Authenticates via OIDC --> Assumes IAM Role
  |
  v
IAM Role (has EBS permissions) --> Allows CSI Driver to manage EBS Volumes
  |
  v
Volume provisioned + attached to Pod
```

```
eksctl create cluster -f eks-cluster.yaml
```

```
eksctl utils associate-iam-oidc-provider --cluster eks-cluster --approve

eksctl create iamserviceaccount \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster eks-cluster \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
    --approve \
    --role-name AmazonEKS_EBS_CSI_DriverRole

eksctl create addon \
    --name aws-ebs-csi-driver \
    --cluster eks-cluster \
    --service-account-role-arn arn:aws:iam::058264205719:role/AmazonEKS_EBS_CSI_DriverRole \
    --force
```

```
kubectl create namespace ns-eks-course
kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

```
kubectl apply -f pvcs.yaml --namespace=ns-eks-course
```

```
kubectl create secret generic mysql-pass --from-literal=password=eks-course-mysql-pw --namespace=ns-eks-course
kubectl apply -f deploy-mysql.yaml --namespace=ns-eks-course
```

```
kubectl apply -f deploy-wordpress-by-deployment.yaml --namespace=ns-eks-course
kubectl apply -f deploy-wordpress-by-statefulset.yaml -n ns-eks-course
```

```
eksctl delete cluster -f eks-cluster.yaml
```
