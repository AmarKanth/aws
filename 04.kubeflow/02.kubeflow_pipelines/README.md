+ Create the cluster
```
minikube start --cpus=4 --memory=12288
```

+ Install and setup kubeflow
  > Installation
  ```
  export PIPELINE_VERSION=2.17.2
  
  kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=$PIPELINE_VERSION"
  kubectl wait --for condition=established --timeout=60s crd/applications.app.k8s.io
  kubectl apply -k .
  ```
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

  > Fix the ml-pipeline deployment, change the livenessProbe, readinessProbe and startupProbe paths to /apis/v2beta1/healthz.

+ kubectl port-forward --address 0.0.0.0 -n kubeflow svc/ml-pipeline-ui 8080:80
+ pip3 install kfp==2.17.3
