# NATS Streaming Server on Kubernetes

This project contains a [Docker image](https://hub.docker.com/r/danielsig727/nats-streaming-server/) and a Helm chart to run NATS Streaming Server in the Kubernetes cluster.
The NATS Streaming Server can run in [fault tollerance mode](https://github.com/nats-io/nats-streaming-server#fault-tolerance)

The project is forked from https://github.com/canhnt/k8s-nats-streaming to use with dynamic provisioning volumes.

## Requirements
- GKE with Kubernetes v1.8.0 or later.

## Syntax
Build Helm chart
```
make helm
```

## Helm chart options

| Keys              | Default | Description                                                           |
|:----------------- |:------- |:-----------------------------------------------------------------------|
| image             | `docker.io/danielsig727/nats-streaming-server:latest`  | Docker image to deploy |
| imagePullPolicy   | `IfNotPresent`  |  |
| clusterId   | `'test-cluster'`  | Cluster ID |
| replicas          | 3  | Number of nats-streaming replicas  |
| storageClass       | `nfs`  | Storage class of the volume claim  |
| storageSize       | `2Gi`  | Storage size of the share volume between nats-streaming replicas  |

## exposing the queue

    kubectl expose service nats-streaming-ft --port=6634 --target-port=4222 --type=LoadBalancer --name=nats-streaming-external
