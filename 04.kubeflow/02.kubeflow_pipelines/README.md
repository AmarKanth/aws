+ Create ec2 machine with GUI
  <br/>

  > Add rule with RDP-3389-0.0.0.0/0
  <br/>
  
  > Setup Swapfile
  ```
  sudo apt update && sudo apt upgrade -y
  
  sudo fallocate -l 8G /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
  ```
  <br/>

  > Install XFCE Desktop & XRDP
  ```
  sudo apt install xfce4 xfce4-goodies dbus-x11 -y
  
  sudo apt install xrdp -y
  
  sudo adduser xrdp ssl-cert
  
  echo "xfce4-session" > ~/.xsession
  
  sudo systemctl restart xrdp
  sudo systemctl enable xrdp
  ```
  <br/>

  > Set a Password for the ubuntu User
  ```
  sudo passwd ubuntu
  ```
  
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
+ pip3 install kfp==2.17.3 --break-system-packages
