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

    return products


def get_all_parents(category):
    all_categories = [category]
    k = category.parent
    while k is not None:
        all_categories.append(k)
        k = k.parent
    return all_categories[::-1]


def get_category_tree(categories):
    categories_sorted = []
    for category in categories:
        child_categories = category.children.all()
        categories_sorted.append(category)
        if child_categories:
            categories_sorted.append(get_category_tree(child_categories))
    return categories_sorted


def get_category_tree_dict(categories):
    categories_sorted = {}
    for category in categories:
        child_categories = category.children.all()
        if child_categories:
            categories_sorted[category] = get_category_tree_dict(child_categories)
        else:
            categories_sorted[category] = None
    return categories_sorted
