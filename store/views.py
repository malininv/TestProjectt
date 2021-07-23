from django.shortcuts import render
from .models import Product, Category
from .utils import get_products_by_category, get_all_parents
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator


def index(request):
    products = Product.objects.all()
    categories = Category.objects.filter(parent=None)

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 2)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'categories': categories,
        'page_obj': page
    }

    template = 'store/index.html'

    return render(request, template, context)


def category_detail(request, hierarchy=None):
    slug = hierarchy.split('/')[-1]
    category = get_object_or_404(Category, slug=slug)
    products = get_products_by_category(category)
    all_cat = get_all_parents(category)

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 2)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'category': category,
        'page_obj': page,
        'all_cat': all_cat
    }

    template = 'store/category_detail.html'

    return render(request, template, context)
