from .models import Category, Product


def get_products_by_category(slug):
    category = Category.objects.get(slug=slug)

    subcategories = category.children.all()
    products = []

    while subcategories:
        temp = []
        for subcategory in subcategories:
            products.extend(subcategory.products.all())
            temp.extend(subcategory.children.all())
        subcategories = temp

    products.extend(category.products.all())

    return products
