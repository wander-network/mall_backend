import os
from celery import Celery

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mall_backend.settings')
app = Celery('mall_backend')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()