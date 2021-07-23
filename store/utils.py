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


# def get_category_tree(all_categories):
#     categories_with_childs = [category.get_all_pa , category, category.parent for category in ]
#     for category in all_categories:
#
#     return categories_with_childs
