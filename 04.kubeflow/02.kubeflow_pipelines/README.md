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

  > Fix the ml-pipeline-ui deployment, change the livenessProbe, readinessProbe and startupProbe paths to /apis/v2beta1/healthz.

+ kubectl port-forward --address 0.0.0.0 -n kubeflow svc/ml-pipeline-ui 8080:8080
+ ssh -i amar-pc.pem -L 8080:localhost:8080 ubuntu@3.110.225.178
