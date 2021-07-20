from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('<slug>/', views.products_by_category, name='category_detail'),
    #path(r'^category/(?P<hierarchy>.+)/$', views.show_category, name='category')
]