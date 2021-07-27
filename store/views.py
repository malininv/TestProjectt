from django.shortcuts import render
from store.models import Product, Category
from store.utils import get_products_by_category, get_all_parents
from django.shortcuts import get_object_or_404, redirect
from django.core.paginator import Paginator
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.template.loader import render_to_string


def index(request):
    categories = Category.objects.filter(parent=None)

    products = Product.objects.all()

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 2)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'page_obj': page,
        'categories': categories
    }

    template = 'store/index.html'

    return render(request, template, context)


def category_detail(request, hierarchy=None):
    categories = Category.objects.filter(parent=None)
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
        'all_parent_categories': all_parent_categories,
        'categories': categories
    }

    template = 'store/index.html'

    return render(request, template, context)


def search_view(request):
    query_search = request.GET.get('search', '')
    products = Product.objects.filter(name__icontains=query_search)

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 2)
    page = paginator.get_page(page_number)

    if request.is_ajax():
        return HttpResponse(render_to_string('store/includes/products_to_show.html', {'products': products, 'page_obj': page}, request))
