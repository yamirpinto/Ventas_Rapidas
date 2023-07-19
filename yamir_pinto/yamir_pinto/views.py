from django.shortcuts import render
from ventas.models import Producto

def mostrar_inicio(request):
    productos = Producto.objects.all()
    contexto = {
        'productos': productos,
        'titulo': 'Página Principal'
    }
    return render(request, 'index.html', contexto)