from django.shortcuts import render
from store.models import Product, Category, OrderItem, Customer, Order
from store.utils import get_products_by_category, get_all_parents, prefix_for_product
from django.shortcuts import get_object_or_404, redirect
from django.core.paginator import Paginator
from django.http import Http404, JsonResponse
from django.template.loader import render_to_string


def index(request):
    products = Product.objects.all()

    page_number = request.GET.get('page', 1)
    paginator = Paginator(products, 12)
    page = paginator.get_page(page_number)

    context = {
        'products': page.object_list,
        'page_obj': page
    }

    template = 'store/index.html'
    if request.is_ajax():
        html = render_to_string('store/includes/products_to_show.html', context, request)
        return JsonResponse({'html': html})
    return render(request, template, context)


def category_detail(request, hierarchy=None):
    slug = hierarchy.split('/')[-1]
    category = get_object_or_404(Category, slug=slug)
    all_parent_categories = get_all_parents(category)
    if hierarchy.split('/') != [c.slug for c in all_parent_categories]:
        raise Http404()
    products = get_products_by_category(category)

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
        html = render_to_string('store/includes/products_to_show.html', context, request)
        return JsonResponse({'html': html})

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

    context = {
        'products': page.object_list,
        'page_obj': page,
        'query_search': query_search
    }

    html = render_to_string('store/includes/products_to_show.html', context, request)
    return JsonResponse({'html': html})


def order_add(request, pk):
    response = redirect(index)
    if request.method == 'POST':
        product = Product.objects.get(pk=pk)
        quantity = request.POST['quantity']
        response.set_cookie(key=f'{prefix_for_product}{product.name}', value=f'{product.pk}/{quantity}')
    return response


def order_remove(request, name):
    response = redirect(cart)
    if request.method == 'POST':
        full_name = f'{prefix_for_product}{name}'
        response.delete_cookie(full_name)
        return response
    return redirect(index)


def order_complete(request):
    if request.method == 'POST':
        cookie = request.COOKIES.get('csrftoken', '')
        customer, created = Customer.objects.get_or_create(cookie=cookie)
        order, created = Order.objects.get_or_create(user=customer)
        response = render(request, 'store/includes/thanks.html', {'order': order})
        for product, v in request.COOKIES.items():
            if prefix_for_product in product:
                product_in_base = Product.objects.get(pk=v.split('/')[0])
                order_item, created = OrderItem.objects.get_or_create(order=order, product=product_in_base)
                order_item.quantity = v.split('/')[1]
                order_item.save()
        return response
    return redirect(index)


def order_payed(request, order_id):
    if request.method == 'POST':
        order = Order.objects.get(pk=order_id)
        order.complete = True
        order.save()
        response = render(request, 'store/includes/payed.html', {'order': order.pk})
        return response
    return redirect(index)


def cart(request):
    order = {}
    for product, v in request.COOKIES.items():
        if prefix_for_product in product:
            order.update({product.replace(prefix_for_product, ''): v.split('/')[1]})

    context = {
        'order': order
    }
    return render(request, 'store/includes/cart.html', context)


def page_not_found_404(request, exception=None):
    return render(request, 'store/includes/errors/404_error.html', {}, status=404)


def bad_request_400(request, exception=None):
    return render(request, 'store/includes/errors/400_error.html', {}, status=400)


def server_error_500(request, exception=None):
    return render(request, 'store/includes/errors/500_error.html', {}, status=500)
