from django.urls import path, re_path
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    re_path(r'^(?P<hierarchy>.+)/$', views.index, name='category_detail')
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
