```
eksctl create cluster -f eks-cluster.yaml

kubectl apply -f redis-leader-deployment.yaml
kubectl apply -f redis-leader-service.yaml

kubectl apply -f redis-followers-deployment.yaml
kubectl apply -f redis-follower-service.yaml

kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml

kubectl scale deployment frontend --replicas=5

eksctl delete cluster -f eks-cluster.yaml
```