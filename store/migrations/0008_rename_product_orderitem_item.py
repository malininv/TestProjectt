# Generated by Django 3.2.5 on 2021-08-05 07:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0007_alter_product_image'),
    ]

    operations = [
        migrations.RenameField(
            model_name='orderitem',
            old_name='product',
            new_name='item',
        ),
    ]
