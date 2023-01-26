# Simple Blog App with Django

## Preruiquisites

docker

---

## Setup

## 1. Clone the repository:

```bash
$ git clone ...
$ cd BlogApp
```

## 2. Build Docker Image

```sh
docker build -t <image-name>:<tag> .
```

## 3. Start Docker Container


```sh
docker run --name <container-name> -p 8000:8000 <image-name>:<tag>
```
