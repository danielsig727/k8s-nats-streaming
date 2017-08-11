# NATS Streaming Server on Kubernetes

This project contains the Docker image (docker.io/canhnt/nats-streaming-server) and a Helm chart to run NATS Streaming Server on a Kubernetes cluster.
The NATS Streaming Server can run in [fault tollerance mode](https://github.com/nats-io/nats-streaming-server#fault-tolerance)

## Requirements
- Kubernetes v1.5.2 or later.
- A NFS instance like Amazon EFS or Google Gluster.

## Syntax
Build Helm chart
```
make helm
```

## Helm chart options

| Keys              | Default | Description                                                           |
| ----------------- | ------- |-----------------------------------------------------------------------|
| image             | 'docker.io/canhnt/nats-streaming-server:v0.5.0'  | Docker image to deploy |
| imagePullPolicy   | 'Always'  |  |
| replicas          | 3  | Number of nats-streaming replicas  |
| storageSize       | 1Gi  | Storage size of the share volume between nats-streaming replicas  |
| pv.serverUrl       | 'FAKED'  | URL of the NFS instance |
