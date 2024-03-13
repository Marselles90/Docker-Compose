FROM python:3.12

WORKDIR /app

# Установка зависимостей Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Установка Django
RUN pip install --no-cache-dir Django

# Копирование кода Django в контейнер
COPY . .

# Сборка статических файлов
RUN python manage.py collectstatic --no-input

# Запуск Gunicorn сервера
CMD [ "gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000" ]
