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
    for subcategory in subcategories:
        products.append(Product.objects.filter(category_id=subcategory.id))

    # category_list = category.children.all()
    # category_parents_ids = []
    # if category.parent:
    #     while category is not None:
    #         category_parents_ids.append(category.id)
    #         category = category.parent
    #
    # category = get_object_or_404(Category, slug=slug)
    # if category.parent:
    #     products = Product.objects.filter(category__slug__in=category_list)
    # else:
    #     products = Product.objects.filter(category__slug__iexact=slug)
    # r_product = Product.objects.get(name__iexact='usualkeyboard1blue')
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