+ Create the cluster
```
minikube start --cpus=4 --memory=12288
```

+ Install and setup kubeflow
  <br/>

  > Delete proxy-agent deployment
  ```
  kubectl delete deployment proxy-agent -n kubeflow
  ```
  <br/>
  
  > Modify the controller-manager deployment
  ```
  securityContext:
    allowPrivilegeEscalation: false
    capabilities:
      drop:
      - ALL
    runAsNonRoot: true
    runAsUser: 65534
    seccompProfile:
      type: RuntimeDefault
  ```
  <br/>

  > Fix the ml-pipeline-ui deployment, change the livenessprobe and readinessprobe paths to the root URL (/). 
