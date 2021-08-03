from django.urls import path, re_path
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('ajax/', views.ajax, name="ajax"),
    path('order_add/<str:pk>/', views.order_add, name="order_add"),
    path('order_remove/<str:pk>/', views.order_remove, name="order_remove"),
    path('cart/', views.cart, name="cart"),
    re_path(r'^(?P<hierarchy>.+)/$', views.category_detail, name='category_detail')
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
