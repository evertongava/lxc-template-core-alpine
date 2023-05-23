REPO = evertongava
NAME = core-alpine
TAG = 3.18
IMAGE = $(REPO)/$(NAME):$(TAG)

build:
	docker build --no-cache -t "$(IMAGE)" .

push:
	docker push "$(IMAGE)"
