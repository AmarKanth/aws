### EKS Autoscaler Script
EKS cluster, deploying the Cluster Autoscaler, running a test workload, and cleaning up resources.

+ Create the EKS cluster using your configuration file
```
eksctl create cluster -f eks-cluster.yaml
```

+ Deploy the Cluster Autoscaler for AWS
```
kubectl apply -f \
https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/ \
cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
```

+ Annotate the Cluster Autoscaler deployment to prevent eviction
```
kubectl -n \
kube-system annotate \
deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"
```

+ Describe the deployment to verify its configuration
```
kubectl -n kube-system describe deployment cluster-autoscaler
```

+ Deploy the test workload (NGINX)
```
kubectl apply -f nginx-deployment.yml
```

+ Scale the test deployment to simulate load
```
kubectl scale --replicas=30 deployment/test-autoscaler
```

+ Tail the Cluster Autoscaler logs to monitor its activity
```
kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler
```

+ Cluster deletion
```
eksctl delete cluster -f eks-cluster.yaml
```

+ Manual Approach to Grant Autoscaling Privileges
```
iam:
      withAddonPolicies:
        autoScaler: true
```
> If the default configuration doesn't work, create an override for the cluster-autoscaler
> service account with autoscaling policies.
