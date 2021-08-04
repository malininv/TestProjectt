from django.db import models


class Category(models.Model):
    name = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(unique=True, blank=True)
    parent = models.ForeignKey('self', blank=True, null=True, related_name='children', on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg')

    class Meta:
        verbose_name_plural = "categories"

    def __str__(self):
        full_path = [self.name]
        k = self.parent
        while k is not None:
            full_path.append(k.name)
            k = k.parent

        return ' -> '.join(full_path[::-1])

    def get_absolute_url(self):
        absolute_url = [self.slug]
        k = self.parent
        while k is not None:
            absolute_url.append(k.slug)
            k = k.parent
        return '/'.join(absolute_url[::-1])


class Product(models.Model):
    name = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    category = models.ForeignKey('Category', related_name='products', on_delete=models.CASCADE)
    image = models.ImageField(null=True, blank=True, default='default.jpg')

    class Meta:
        ordering = ['name']

    def get_absolute_url(self):
        return self.slug

    def __str__(self):
        return self.name


class OrderItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return self.product.name
