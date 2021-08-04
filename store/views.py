from django.shortcuts import render
from store.models import Product, Category, OrderItem
from store.utils import get_products_by_category, get_all_parents, get_pages
from django.shortcuts import get_object_or_404, redirect
from django.core.paginator import Paginator
from django.http import Http404, JsonResponse


def index(request):
    query_search = request.GET.get('search', '')
    if query_search:
        products = Product.objects.filter(name__icontains=query_search)
    else:
        products = Product.objects.all()

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 12)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'page_obj': page,
        'query_search': query_search
    }

    template = 'store/index.html'
    if request.is_ajax():
        return JsonResponse(get_pages(page, query_search), safe=False)
    return render(request, template, context)


def category_detail(request, hierarchy=None):
    slug = hierarchy.split('/')[-1]
    category = get_object_or_404(Category, slug=slug)
    all_parent_categories = get_all_parents(category)
    if hierarchy.split('/') == [c.slug for c in all_parent_categories]:
        products = get_products_by_category(category)
    else:
        raise Http404()

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 12)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'current_category': category,
        'page_obj': page,
        'all_parent_categories': all_parent_categories
    }

    template = 'store/index.html'
    if request.is_ajax():
        return JsonResponse(get_pages(page), safe=False)

    return render(request, template, context)


def ajax(request):
    if not request.is_ajax():
        raise Http404()

    query_search = request.GET.get('search', '')
    if query_search:
        products = Product.objects.filter(name__icontains=query_search)
    else:
        products = Product.objects.all()

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 12)
    page = paginator.get_page(page_number)

    return JsonResponse(get_pages(page, query_search), safe=False)


def order_add(request, pk):
    if request.method == 'POST':
        product = Product.objects.get(pk=pk)
        OrderItem.objects.create(product=product)
    return redirect(index)


def order_remove(request, pk):
    if request.method == 'POST':
        order_item = OrderItem.objects.get(pk=pk)
        order_item.delete()
    return redirect(cart)


def cart(request):
    orders = OrderItem.objects.all().select_related('product')
    context = {
        'orders': orders
    }
    return render(request, 'store/includes/cart.html', context)


def page_not_found_404(request, exception=None):
    return render(request, 'store/includes/errors/404_error.html', {}, status=404)


def bad_request_400(request, exception=None):
    return render(request, 'store/includes/errors/400_error.html', {}, status=400)


def server_error_500(request, exception=None):
    return render(request, 'store/includes/errors/500_error.html', {}, status=500)
