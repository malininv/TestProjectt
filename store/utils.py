def get_products_by_category(category):
    subcategories = category.children.all()
    products = []

    while subcategories:
        temp = []
        for subcategory in subcategories:
            products.extend(subcategory.products.all())
            temp.extend(subcategory.children.all())
        subcategories = temp

    products.extend(category.products.all())

    return sorted(products)


def get_all_parents(category):
    all_categories = [category]
    k = category.parent
    while k is not None:
        all_categories.append(k)
        k = k.parent
    return all_categories[::-1]
