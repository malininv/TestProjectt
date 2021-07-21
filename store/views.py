from django.shortcuts import render
from django.shortcuts import get_object_or_404
from .models import Product, Category
from .utils import get_products_by_category


def index(request):
    products = Product.objects.all()
    categories = Category.objects.filter(parent__isnull=True)
    context = {
        'products': products,
        'categories': categories,
    }

    template = 'store/index.html'

    return render(request, template, context)


def products_by_category(request, slug):
    products = get_products_by_category(slug)
    category = get_object_or_404(Category, slug=slug)
    subcategories = category.children.all()

    context = {
        'products': products,
        'category': category,
        'subcategories': subcategories
    }

    template = 'store/by_category.html'

    return render(request, template, context)
