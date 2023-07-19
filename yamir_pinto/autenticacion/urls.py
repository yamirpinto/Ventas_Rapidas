from django.urls import path
from .views import mostrar_login, mostrar_registro, mostrar_registro_admin, logout_view

app_name = 'autenticacion'

urlpatterns = [
    path('login/', mostrar_login, name='login'),
    path('registro/', mostrar_registro, name='registro'),
    path('registro-admin/', mostrar_registro_admin, name='registro_admin'),
    path('logout/', logout_view, name='logout'),

]