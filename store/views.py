from django.shortcuts import render
from .models import Product, Category
from .utils import get_products_by_category, get_all_parents, get_category_tree
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator
from django.http import Http404


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
    all_parent_categories = get_all_parents(category)

    if hierarchy.split('/') == [c.slug for c in all_parent_categories]:
        products = get_products_by_category(category)
    else:
        raise Http404('Invalid url')

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 2)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'category': category,
        'page_obj': page,
        'all_parent_categories': all_parent_categories
    }

    template = 'store/category_detail.html'

    return render(request, template, context)
