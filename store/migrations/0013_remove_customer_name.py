# Generated by Django 3.2.5 on 2021-08-05 10:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0012_rename_device_customer_cookie'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customer',
            name='name',
        ),
    ]