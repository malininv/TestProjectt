from django.shortcuts import render
from .models import Product, Category
from .utils import get_products_by_category
from django.shortcuts import get_object_or_404


def index(request):
    products = Product.objects.all()
    categories = Category.objects.filter(parent__isnull=True)
    context = {
        'products': products,
        'categories': categories,
    }

    template = 'store/index.html'

    return render(request, template, context)


def products_by_category(request, hierarchy):
    slugs = hierarchy.split('/')
    slug = slugs[-1]
    products = get_products_by_category(slug)
    category = Category.objects.get(slug=slug)
    subcategories = category.children.all()

    context = {
        'products': products,
        'category': category,
        'subcategories': subcategories
    }

    template = 'store/by_category.html'

    return render(request, template, context)
