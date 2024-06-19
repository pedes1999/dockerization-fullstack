podman: clean image network
	podman run --name frontend \
		-p 8000:80 \
		--mount type=bind,src=$(shell pwd)/nginx.conf,dst=/etc/nginx/nginx.conf \
		--mount type=bind,src=$(shell pwd)/default.conf,dst=/etc/nginx/conf.d/default.conf \
		--mount type=bind,src=$(shell pwd)/index.html,dst=/usr/share/nginx/html/index.html \
		--net frontend \
		-d frontend

network:
	-podman network create -d bridge frontend

image: 
	podman build -t frontend .

clean:
	-podman stop frontend
	-podman rm -f frontend
	-podman network rm frontend
