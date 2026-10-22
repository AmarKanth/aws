```
minikube start

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

minkube ip

kubectl set image deployment/client-deployment client=stephengrider/multi-client:v5
eval $(minikube docker-env)

kubectl logs client-deployment-sdfsf242
kubectl exec -it client-deployment-sdfsf242 sh
```
