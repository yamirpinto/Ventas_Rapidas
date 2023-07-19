from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import mostrar_new_producto, mostrar_edit_producto, mostrar_producto, mostrar_productos, venta_realizada, ver_carrito, agregar_al_carrito, realizar_compra

app_name = 'ventas'

urlpatterns = [
    path('new/', mostrar_new_producto, name="new_producto"),
    path('<int:pk>/edit/', mostrar_edit_producto, name="edit_producto"),
    path('<int:pk>/', mostrar_producto, name="mostrar_producto"),
    path('', mostrar_productos, name="mostrar_productos"),
    path('carrito/', ver_carrito, name='ver_carrito'),
    path('producto/<int:pk>/agregar-al-carrito/', agregar_al_carrito, name='agregar_al_carrito'),
    path('realizar-compra/', realizar_compra, name='realizar_compra'),
    path('venta-realizada/<int:pk>/', venta_realizada, name='venta_realizada'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
