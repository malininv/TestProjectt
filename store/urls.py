from django.urls import path, re_path, include
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('ajax/', views.ajax, name="ajax"),
    path('order_add/<str:pk>/', views.order_add, name="order_add"),
    path('order_remove/<str:slug>/', views.order_remove, name="order_remove"),
    path('cart/', views.cart, name="cart"),
    path('order_complete/', views.order_complete, name="order_complete"),
    path('order_payed/<str:order_id>', views.order_payed, name="order_payed"),
    re_path(r'^(?P<hierarchy>.+)/$', views.category_detail, name='category_detail')
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
