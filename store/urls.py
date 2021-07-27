from django.urls import path, re_path
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('ajax/', views.search_view, name="ajax"),
    re_path(r'^(?P<hierarchy>.+)/$', views.category_detail, name='category_detail'),

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
