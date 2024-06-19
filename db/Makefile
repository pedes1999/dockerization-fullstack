.ONESHEL:
PASSWORD:=$(shell cat ../secrets/db.pass)
podman: clean image network
	mkdir -p data 
	podman run --name postgres \
		-p 5432:5432 \
		--mount type=bind,src=$(shell pwd)/my.cnf,dst=/etc/my.cnf \
		--mount type=bind,src=$(shell pwd)/data,dst=/var/lib/postgresql/data \
		--mount type=bind,src=$(shell pwd)/init.sql,dst=/docker-entrypoint-initdb.d/01.sql \
		--net=dbnet \
		-e POSTGRES_DB=mydatabase \
		-e POSTGRES_USER=myuser \
		-e POSTGRES_PASSWORD=$(PASSWORD) \
		-d postgres
image:
	podman build -t postgres --build-arg DB_PASSWORD=$(PASSWORD) .

network: 
	-podman network create dbnet

clean:
	-podman stop postgres
	-podman rm -f postgres
	-podman network rm dbnet
