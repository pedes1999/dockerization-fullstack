.ONESHELL:

init-directories:
	sudo mkdir -p /var/lib/docker
	sudo mkdir -p /var/run
	sudo mkdir -p /sys
	sudo mkdir -p /dev/disk

prometheus: clean network cadvisor
	podman run --name prometheus \
		-p 9090:9090 \
		--mount type=bind,src=$(shell pwd)/prometheus.yml,dst=/etc/prometheus/prometheus.yml \
		--net appnet \
		--net dbnet \
		--add-host=host.podman.internal:host-gateway \
		-d prom/prometheus

cadvisor:
	podman run \
  	--volume=/:/rootfs:ro \
  	--volume=/var/run:/var/run:ro \
  	--volume=/sys:/sys:ro \
  	--volume=/var/lib/docker/:/var/lib/docker:ro \
  	--volume=/dev/disk/:/dev/disk:ro \
  	--publish=8090:8080 \
	--net appnet \
	--net dbnet \
  	--detach=true \
  	--name=cadvisor \
  	--privileged \
  	--device=/dev/kmsg \
  	gcr.io/cadvisor/cadvisor:v0.49.1

grafana:
		podman run --name grafana \
		-p 3000:3000 \
		--net appnet \
		--net dbnet \
		-d grafana/grafana-oss

network:
	-podman network create -d bridge dbnet
	-podman network create -d bridge appnet


clean:
	-podman stop prometheus
	-podman rm -f prometheus
	-podman stop cadvisor
	-podman rm -f cadvisor
	-podman stop grafana
	-podman rm -f grafana
	-podman network rm dbnet
	-podman network rm appnet
