```
kubectl apply -f k8s
kubectl create secret generic pgpassword --from-literal PGPASSWORD=123
minikube addons enable ingress
minikube ip
minikube dashboard
```