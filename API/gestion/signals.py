from django.db.models.signals import post_migrate
from django.contrib.auth.models import User
from django.db import IntegrityError
from django.apps import apps

def create_default_users(sender, **kwargs):
    try:
        User.objects.create_superuser('admin', 'admin@gestion.com', 'Admin2020')
    except IntegrityError:
        pass

post_migrate.connect(create_default_users, sender=apps.get_app_config('gestion'))
