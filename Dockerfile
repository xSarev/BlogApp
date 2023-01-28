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

RUN chown -R user:user /app

USER user

EXPOSE 8000

ENTRYPOINT ["python3", "manage.py", "runserver"]
CMD ["0.0.0.0:8000"]
