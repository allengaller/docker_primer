#!/bin/bash

app=$(docker run -d -P -v $PWD/flask:/flask  \
	-v $PWD/nginx.conf:/etc/nginx/nginx.conf \
	-v $PWD/supervisord.conf:/supervisord.conf \
	nijialiang/flask -c /supervisord.conf)
echo $app
