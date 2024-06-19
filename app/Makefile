PASSWORD:=$(shell cat ../secrets/db.pass)

podman: clean image network
	podman run --name app \
		-p 6000:6000 \
		--net dbnet \
		--net frontend \
		-e APP_PORT=6000 \
		-e DB_PASSWORD=$(PASSWORD)\
		-d app
#run: venv
#	. venv/bin/activate; cd src; python3 -m flask run 

#venv:
#	virtualenv venv
#	. venv/bin/activate; cd src; pip install -Ur requirements.txt

network:
	-podman network create -d bridge dbnet
	-podman network create -d bridge frontend

image: 
	podman build -t app .


clean:
#	-deactivate
#	rm -rvf venv
	-podman stop app
	-podman rm -f app
	-podman network rm dbnet
	-podman network rm frontend
