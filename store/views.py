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
    categories = Category.objects.all()
    category = get_object_or_404(Category, slug=slug)
    products = Product.objects.filter(category=category)

    context = {
        'products': products,
        'category': category,
        'categories': categories
    }

    template = 'store/by_category.html'

    return render(request, template, context)

# def show_category(request, hierarchy=None):
#     category_slug = hierarchy.split('/')
#     category_queryset = list(Category.objects.all())
#     all_slugs = [x.slug for x in category_queryset]
#     parent = None
#     for slug in category_slug:
#         if slug in all_slugs:
#             parent = get_object_or_404(Category, slug=slug, parent=parent)
#         else:
#             instance = get_object_or_404(Product, slug=slug)
#             breadcrumbs_link = instance.get_cat_list()
#             category_name = [' '.join(i.split('/')[-1].split('-')) for i in breadcrumbs_link]
#             breadcrumbs = zip(breadcrumbs_link, category_name)
#             return render(request, "postDetail.html", {'instance': instance, 'breadcrumbs': breadcrumbs})
#
#     return render(request, "categories.html",
#                   {'post_set': parent.post_set.all(), 'sub_categories': parent.children.all()})

