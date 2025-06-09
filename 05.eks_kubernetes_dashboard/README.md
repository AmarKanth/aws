### Kubernetes Dashboard

+ Deploy kubernetes dashboard
```
kubectl apply -f \
https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/\
deploy/recommended.yaml

kubectl get all -n kubernetes-dashboard
```

+ Create service account
```
kubectl apply -f admin-service-account.yaml
```

+ Create token manually(auto generated tokens not working)
```
kubectl apply -f eks-course-admin-token.yaml

SECRET_NAME=$(kubectl -n kube-system get secret | grep eks-course-admin | awk '{print $1}')
kubectl -n kube-system describe secret $SECRET_NAME
```

+ Start the proxy server
```
kubectl proxy
```

+ To access the dashboard
```
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/\
services/https:kubernetes-dashboard:/proxy/#/login
```

+ Clean up cluster
```
eksctl delete cluster -f eks-cluster.yaml
```