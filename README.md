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

## 2. Create sqlite db

```sh
python3 manage.py migrate
```

## 3. Create django superuser

```sh
python3 manage.py createsuperuser
```

## 4. Build Docker Image

```sh
docker build -t <image-name>:<tag> .
```

## 5. Start Docker Container

```sh
docker run --name <container-name> -p 8000:8000 <image-name>:<tag>
```

## 5. Login with django superuser and start creating blogs