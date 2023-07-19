from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .views import mostrar_inicio

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', mostrar_inicio, name="mostrar_inicio"),
    path('productos/', include(('ventas.urls', 'ventas'), namespace='ventas')),
    path('', include(('autenticacion.urls'), namespace = 'autenticacion'))
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)