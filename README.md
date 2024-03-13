## sudo docker-compose build
## sudo docker-compose up -d

## Введение 
Docker - это платформа для разработки, доставки и эксплуатации приложений в контейнерах. Контейнеры - это изолированные, легкие, исполняемые среды, содержащие все необходимое для запуска приложения.

В этом документе представлены основные команды Docker:

### 1. Управление образами

### docker build:
- Описание: Собирает образ из Dockerfile.
- Пример: sudo docker build -t my-app .


#### docker pull:
- Описание: Загружает образ из реестра Docker Hub.
- Пример: sudo docker pull docker.io/library/postgres:latest

#### docker push:
- Описание: Отправляет образ в реестр Docker Hub.
- Пример: sudo docker push my-app

#### docker images:
- Описание: Выводит список образов на локальной машине.

#### docker rmi:
- Описание: Удаляет образ с локальной машины.
- Пример: sudo docker rmi my-app

### 2. Управление контейнерами:

#### docker run:
- Описание: Запускает контейнер из образа.
- Пример: sudo docker run -p 8000:8000 my-app

#### docker ps:
- Описание: Выводит список запущенных контейнеров.

#### docker stop:
- Описание: Останавливает контейнер.
- Пример: sudo docker stop my-app

#### docker start:
- Описание: Запускает остановленный контейнер.
- Пример: sudo docker start my-app

#### docker restart:
- Описание: Перезапускает контейнер.
- Пример: sudo docker restart my-app

#### docker logs:
- Описание: Выводит логи контейнера.
- Пример: sudo docker logs my-app

#### docker exec:
- Описание: Выполняет команду в контейнере.
- Пример: sudo docker exec -it my-app bash

#### docker rm:
- Описание: Удаляет контейнер.
- Пример: sudo docker rm my-app

### 3. Дополнительные команды:

#### docker inspect:
- Описание: Выводит подробную информацию о контейнере или образе.
- Пример: sudo docker inspect my-app

#### docker history:
- Описание: Выводит историю изменений образа.
- Пример: sudo docker history my-app

#### docker login:
- Описание: Авторизуется в реестре Docker Hub.

#### docker logout:
- Описание: Выходит из учетной записи Docker Hub.

#### docker help:
- Описание: Выводит справку по командам Docker.

### Важно:

- sudo используется для выполнения команд с правами root.
- -t в команде docker run указывает имя контейнера.
- -p в команде docker run публикует порт контейнера на хост-машине.

### Дополнительные команды:

#### docker-compose:
- Описание: Инструмент для управления сложными приложениями, состоящими из нескольких контейнеров.

### Ссылки:

- Docker Documentation: [https://docs.docker.com/](https://docs.docker.com/)
- Docker Compose Documentation: [https://docs.docker.com/compose/](https://docs.docker.com/compose/)




# README.md: Обзор Docker Compose

## Введение:

Docker Compose - это инструмент для определения и запуска многоконтейнерных приложений Docker. Он позволяет указать сервисы, сети и тома, необходимые для вашего приложения, в одном файле YAML.

Этот README предоставляет обзор конфигурации Docker Compose, предоставленной вами.

## Сервисы:

### PostgreSQL:
- Изображение: postgres:latest
- Переменные среды:
  - POSTGRES_DB: my_database
  - POSTGRES_USER: my_user
  - POSTGRES_PASSWORD: 123456
- Порты: 5432:5432
- Тома: Подключает скрипт init.sql для инициализации базы данных.

### Django:
- Сборка: .
- Порты: 8000:8000
- Переменные среды:
  - POSTGRES_HOST: postgres
  - POSTGRES_DB: my_database
  - POSTGRES_USER: my_user
  - POSTGRES_PASSWORD: 123456
  - REDIS_HOST: redis
  - REDIS_PORT: 6379
- Зависимости: postgres, redis

### Celery:
- Сборка: .
- Команда: Запускает рабочего Celery.
- Тома: Подключает код приложения.
- Зависимости: redis

### Flower:
- Сборка: .
- Команда: Запускает Flower для мониторинга задач Celery.
- Порты: 5555:5555
- Тома: Подключает код приложения.
- Зависимости: redis, celery

### Redis:
- Изображение: redis:latest
- Порты: 6379:6379

### Bot:
- Сборка: .
- Команда: Запускает Python бота.
- Тома: Подключает код приложения.
- Зависимости: django

## Использование:
1. Убедитесь, что Docker и Docker Compose установлены на вашей системе.
2. Поместите предоставленный файл docker-compose.yml в каталог вашего проекта.
3. Выполните docker-compose up, чтобы запустить сервисы, определенные в конфигурации.
4. Доступ к вашему Django-приложению можно получить по адресу http://localhost:8000/.
5. Мониторинг задач Celery можно осуществить с помощью Flower по адресу http://localhost:5555/.
6. Доступ к базе данных PostgreSQL по адресу localhost:5432.

Для получения дополнительной информации о Docker Compose обратитесь к [официальной документации](https://docs.docker.com/compose/).