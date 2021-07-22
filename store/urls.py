from django.urls import path, re_path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    re_path(r'^(?P<hierarchy>.+)/$', views.products_by_category, name='category_detail')
]
