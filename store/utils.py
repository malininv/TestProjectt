from urllib.parse import urlencode


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


def get_children(category_, all_categories):
    child_categories = []
    for category in all_categories:
        if category.parent_id == category_.id:
            child_categories.append(category)
    return child_categories


def get_category_tree(top_categories, all_categories):
    tree = {}
    for top_category in top_categories:
        child_categories = get_children(top_category, all_categories)
        tree[top_category] = get_category_tree(child_categories, all_categories)
    return tree


def get_pages(page, query_search=''):
    if page.has_next():
        n_page = page.next_page_number()
    else:
        n_page = ''
    if page.has_previous():
        p_page = page.previous_page_number()
    else:
        p_page = ''
    next_page = urlencode({'search': query_search, 'page': n_page})
    prev_page = urlencode({'search': query_search, 'page': p_page})

    pages = {'next_page': next_page,
             'prev_page': prev_page}
    data = []
    for product in page.object_list:
        if product.image:
            image_url = product.image.url
        else:
            image_url = product.category.image.url
        data.append({'name': product.name, 'image': image_url, 'id': product.id})
    data.append(pages)
    return data
