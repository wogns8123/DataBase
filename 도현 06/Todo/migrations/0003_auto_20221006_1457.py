# Generated by Django 3.2.13 on 2022-10-06 05:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Todo', '0002_todo_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='todo',
            name='content',
        ),
        migrations.AlterField(
            model_name='todo',
            name='title',
            field=models.CharField(max_length=120),
        ),
    ]
