1. Managed NFS(network file system) that can be mounted on many ec2
2. EFS works with ec2 instances with multi-az

```
eksctl create cluster -f eks-cluster.yaml
```

```
kubectl create namespace ns-eks-course-efs
```

```
helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-efs-csi-driver/
helm repo update
helm search repo aws-efs-csi-driver
helm install aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver
```

```
kubectl get pod -n default -l "app.kubernetes.io/name=aws-efs-csi-driver,app.kubernetes.io/instance=aws-efs-csi-driver"
```

```
kubectl apply -f storageclass.yaml -n ns-eks-course-efs
```

```
kubectl apply -f pv.yaml -n ns-eks-course-efs
```

```
kubectl apply -f claim.yaml -n ns-eks-course-efs
```

```
kubectl create secret generic mysql-pass --from-literal=password=eks-course-mysql-pw --namespace=ns-eks-course-efs
kubectl apply -f mysql-deployment.yaml -n ns-eks-course-efs
```

```
ssh into the node
kubectl get pods -n ns-eks-course-efs -o wide
inside the instance 
sudo mount | grep csi
to see the list of folders in the specific mount
sudo ls -al /var/lib/kubelet/pods/2cc8adaf-2d64-4f05-bca2-0ae8a97770fb/volumes/kubernetes.io~csi/efs-psv-eks/mount
```

```
kubectl apply -f wp-deployment.yaml -n ns-eks-course-efs
```

```
eksctl delete cluster -f eks-cluster.yaml
```