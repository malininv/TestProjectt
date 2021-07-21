from django.shortcuts import render
from django.shortcuts import get_object_or_404
from .models import Product, Category


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
    category = get_object_or_404(Category, slug=slug)

    subcategories = category.children.all()

    products = []

    if subcategories:
        for subcategory in subcategories:
            if subcategory.children.all():
                subsubcategories = subcategory.children.all()
                for subsubcategory in subsubcategories:
                    products.append(subsubcategory.products.all())
            products.append(subcategory.products.all())
    else:
        products = category.products.all()

    context = {
        'products': products,
        'category': category,
        'subcategories': subcategories
        # 'category_list': category_list,
        #'r_product': r_product,
        #'category_parents_ids': category_parents_ids
    }

    template = 'store/by_category.html'

    return render(request, template, context)