from django.db.models.signals import pre_save
from django.dispatch import receiver
from .models import Category, Product
from django.utils.text import slugify


@receiver(pre_save, sender=Category)
def slugify_category(sender, instance, **kwargs):
    if not instance.slug:
        instance.slug = slugify(instance.name)


@receiver(pre_save, sender=Product)
def slugify_product(sender, instance, **kwargs):
    if not instance.slug:
        instance.slug = slugify(instance.name)
