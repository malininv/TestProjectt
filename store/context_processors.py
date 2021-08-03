from store.models import Category, OrderItem
from store.utils import get_category_tree


def extras(request):
    all_categories = Category.objects.all().select_related('parent')
    top_categories = [category for category in all_categories if category.parent is None]
    categories = get_category_tree(top_categories, all_categories)
    items_in_store = OrderItem.objects.count()
    return {'categories': categories,
            'items_in_store': items_in_store}
