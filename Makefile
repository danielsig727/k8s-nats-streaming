IMAGE_NAME=nats-streaming-server
PREFIX=danielsig727/nats-streaming-server
TAG=v0.9.2

.PHONY: docker
docker:
	docker build -t $(IMAGE_NAME) .

.PHONY: push
push:
	docker tag $(IMAGE_NAME) $(PREFIX):$(TAG)
	docker push $(PREFIX):$(TAG)

.PHONY: helm
helm: 
	helm package charts/nats-streaming