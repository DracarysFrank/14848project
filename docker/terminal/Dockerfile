FROM python:latest
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"