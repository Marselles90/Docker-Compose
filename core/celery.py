from celery import Celery

app = Celery('tasks', broker='redis://redis:6379')

@app.task
def add(x, y):
    print('Работает')
    return x + y
add(5, 3)
