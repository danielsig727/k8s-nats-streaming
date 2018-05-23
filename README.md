# NATS Streaming Server on Kubernetes

This project uses official nats-streaming image and a Helm chart to run NATS Streaming Server in the Kubernetes cluster.
The NATS Streaming Server can run in either fault tolerance or high availability mode. See the config below.
See https://github.com/nats-io/nats-streaming-server for details.

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
| image             | `docker.io/nats-streaming:0.9.2-linux`  | Docker image to deploy |
| imagePullPolicy   | `IfNotPresent`  |  |
| clusterId   | `test-cluster`  | Cluster ID |
| replicas          | 3  | Number of nats-streaming replicas  |
| storageClass       | `standard`  | Storage class of the volume claim  |
| storageSize       | `2Gi`  | Storage size of the share volume between nats-streaming replicas  |
| useFaultTolerance | `false` | Use fault tolerance mode (instead of high availability mode) |
| loadBalancer.create | `true` | Create a load balancer exposing the service |
| loadBalancer.natsExternalPort | `4222` | If set, expose nats port (4222) as the port |
| loadBalancer.clusteringExternalPort | `Not set` |  If set, expose nats clustering port (6222) as the port |
| loadBalancer.monitoringExternalPort | `Not set` | If set, expose nats monitoring port (8222) as the port |
