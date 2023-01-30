REPO = evertongava
NAME = core-alpine
TAG = 3.16.2
IMAGE = $(REPO)$(NAME):$(TAG)

build:
	docker build --no-cache -t "$(IMAGE)" .

push:
	docker push "$(IMAGE)"
