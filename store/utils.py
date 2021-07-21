from .models import Category


def get_products_by_category(slug):
    category = Category.objects.get(slug=slug)

    subcategories = category.children.all()
    products = [category.products.all()]

    while subcategories:
        temp = []
        for subcategory in subcategories:
            products.extend(subcategory.products.all())
            temp.extend(subcategory.children.all())
        subcategories = temp

    return products
