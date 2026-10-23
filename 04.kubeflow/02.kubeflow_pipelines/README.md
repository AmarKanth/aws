+ Create the cluster
```
brew install colima
brew install lima
brew install lima-additional-guestagents
colima start -p kubeflow-demo --arch x86_64 --cpu 4 --memory 8 --with-kubernetes
```

+ Install kubeflow
+ Delete proxy-agent
```
kubectl delete deployment proxy-agent -n kubeflow
```