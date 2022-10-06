from unittest.util import _MAX_LENGTH
from django.db import models
from django.conf import settings


# Create your models here.
class Todo(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=120)
    completed = models.BooleanField()

    def __str__(self):
        return self.title
