FROM python:3.9-alpine

LABEL maintainer="xsarev"

RUN pip install --upgrade pip setuptools wheel

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN apk add --update --no-cache \
	jpeg-dev zlib-dev libjpeg

RUN apk add --update --no-cache --virtual .tmp-build-deps \
	gcc libc-dev linux-headers \
	python3-dev

RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

WORKDIR /app
COPY ./mysite /app

RUN adduser -D user
USER user

ENTRYPOINT ["python3", "manage.py", "runserver"]