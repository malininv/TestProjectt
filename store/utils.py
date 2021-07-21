from .models import Category
from django.shortcuts import get_object_or_404


def get_products_by_category(slug):
    category = get_object_or_404(Category, slug=slug)

    subcategories = category.children.all()
    products = [category.products.all()]

    while subcategories:
        temp = []
        for subcategory in subcategories:
            products.extend(subcategory.products.all())
            temp.extend(subcategory.children.all())
        subcategories = temp

    return products
