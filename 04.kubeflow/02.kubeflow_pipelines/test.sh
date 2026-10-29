for pair in \
  cache-deployer-deployment=kfp-cache-deployer \
  cache-server=kfp-cache-server \
  metadata-envoy-deployment=kfp-metadata-envoy \
  metadata-writer=kfp-metadata-writer \
  ml-pipeline-persistenceagent=kfp-persistence-agent \
  ml-pipeline-scheduledworkflow=kfp-scheduled-workflow-controller \
  ml-pipeline-viewer-crd=kfp-viewer-crd-controller \
  ml-pipeline-visualizationserver=kfp-visualization-server
do
  d=${pair%%=*}; img=${pair#*=}
  kubectl set image deploy/$d -n kubeflow "*=ghcr.io/kubeflow/$img:2.17.2"
done
