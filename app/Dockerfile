FROM python:3-slim
# prepare application libs
COPY requirements.txt /
RUN pip3 install -r /requirements.txt
RUN mkdir /app
# copy our startup script
COPY /src/start.sh /app
RUN chmod +x /app/start.sh
# copy our python files
COPY src/*.py /app/

WORKDIR /app
# pass dynamically all vars through env 
# using docker network we can find the db ip by using hostname "db"
ENV DB_HOST postgres 
ENV DB_USER myuser
ENV DB_PASSWORD mypass
ENV DB_NAME snm
ENV APP_HOSTNAME 0.0.0.0
ENV APP_PORT 5000
EXPOSE 5000
WORKDIR /app

CMD ["/bin/sh", "./start.sh"]
