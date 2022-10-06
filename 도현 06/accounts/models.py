from django.db import models
from django.contrib.auth.models import AbstractUser
from pytz import timezone
from traitlets import default

# Create your models here.
class User(AbstractUser):
    last_login = models.DateTimeField(auto_now_add=True)
