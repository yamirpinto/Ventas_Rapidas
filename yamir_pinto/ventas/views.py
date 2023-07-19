from django.http import HttpResponseBadRequest
from django.shortcuts import get_object_or_404, render, redirect
from .models import Producto, Compra, DetalleCompra, ComprobanteVenta
from .forms import FormularioProducto
from django.utils import timezone
from sweetify import success, warning
from django.db.models import F, Sum
from django.contrib.auth.decorators import login_required, permission_required

# Lógica de Productos: Subir-Listar-Mostrar 1x1
@login_required
@permission_required('ventas.can_create_product', raise_exception=True)
def mostrar_new_producto(request):
    if request.method == 'POST':
        form_validation = FormularioProducto(request.POST, request.FILES)
        if form_validation.is_valid():
            producto = form_validation.save()
            success(request, f'Producto {producto.nombre} subido exitosamente')
            return redirect('mostrar_producto', pk=producto.pk)
    else:
        form_validation = FormularioProducto()

    contexto = {
        'formulario': form_validation,
        'titulo': 'Cargar Nuevo Producto'
    }
    return render(request, 'productos/new_product.html', contexto)

@login_required
@permission_required('ventas.can_create_product', raise_exception=True)
def mostrar_edit_producto(request, pk):
    producto = get_object_or_404(Producto, pk=pk)
    if request.method == 'POST':
        formulario = FormularioProducto(request.POST, request.FILES, instance=producto)
        if formulario.is_valid():
            producto = formulario.save(commit=False)
            producto.fecha_creacion = timezone.now()
            producto.save()
            success(request, f'Producto {producto.nombre} actualizado exitosamente')
            return redirect('mostrar_producto', pk=producto.pk)
    else:
        formulario = FormularioProducto(instance=producto)

    contexto = {
        'formulario': formulario,
        'titulo': 'Editar Producto'
    }
    return render(request, 'productos/edit_product.html', contexto)

def mostrar_producto(request, pk):
    producto = get_object_or_404(Producto, pk=pk)
    contexto = {
        'producto': producto,
        'titulo': 'Vista de Producto'
    }
    return render(request, 'productos/product_detail.html', contexto)

def mostrar_productos(request):
    productos = Producto.objects.all()
    contexto = {
        'productos': productos,
        'titulo': 'Productos'
    }
    return render(request, 'productos/productos.html', contexto)

# Lógica de carrito de compras: agregar - ver - eliminar - avanzar a la compra
@login_required
def agregar_al_carrito(request, pk):
    producto = get_object_or_404(Producto, pk=pk)

    if request.method == 'POST':
        cantidad = int(request.POST.get('cantidad', 1))

        if cantidad > producto.cantidad_stock:
            warning(request, f'No hay suficiente stock de {producto.nombre}. Solo hay {producto.cantidad_stock} en stock.')
            return redirect('ventas:ver_carrito')

        if cantidad > 0:
            carrito = request.session.get('carrito', {})  # Obtener el carrito de la sesión
            carrito.setdefault(str(pk), 0)  # Si no existe, establecer la cantidad en 0
            carrito[str(pk)] += cantidad  # Incrementar la cantidad del producto

            request.session['carrito'] = carrito  # Guardar el carrito actualizado en la sesión

            success(request, 'El producto ha sido añadido al carrito.')

            return redirect('ventas:ver_carrito')

    return HttpResponseBadRequest("Bad Request")



@login_required
def ver_carrito(request):
    carrito = request.session.get('carrito', {})  # Obtener el carrito de la sesión
    productos = Producto.objects.filter(pk__in=carrito.keys())

    detalles = []
    total = 0

    for producto in productos:
        cantidad = carrito[str(producto.pk)]  # Obtener la cantidad del producto del carrito
        subtotal = producto.precio * cantidad
        detalles.append({'producto': producto, 'cantidad': cantidad, 'subtotal': subtotal})
        total += subtotal

    contexto = {
        'detalles': detalles,
        'total': total,
        'titulo': 'Carrito de Compras'
    }

    return render(request, 'ventas/carrito.html', contexto)

@login_required
@login_required
def realizar_compra(request):
    compra = Compra.objects.filter(usuario=request.user, estado='activo').first()

    if not compra:
        # Crear una nueva compra si no existe una activa para el usuario
        compra = Compra.objects.create(usuario=request.user, estado='activo')

    detalles = []
    total = 0

    carrito = request.session.get('carrito', {})  # Obtener el carrito de la sesión
    productos = Producto.objects.filter(pk__in=carrito.keys())

    for producto in productos:
        cantidad = carrito[str(producto.pk)]  # Obtener la cantidad del producto del carrito
        subtotal = producto.precio * cantidad
        detalles.append({'producto': producto, 'cantidad': cantidad, 'subtotal': subtotal})
        total += subtotal

        # Crear el detalle de compra asociado a la compra actual
        DetalleCompra.objects.create(compra=compra, producto=producto, cantidad=cantidad)

        # Disminuir la cantidad de producto en stock
        producto.cantidad_stock -= cantidad
        producto.save()

    if request.method == 'POST':
        comprobante = ComprobanteVenta.objects.create(compra=compra, total=total)
        compra.estado = 'R'
        compra.save()
        request.session.pop('carrito', None)  # Limpiar el carrito de la sesión
        success(request, f'Compra realizada con éxito por un total de: {comprobante.total}')
        return redirect('ventas:venta_realizada', pk=comprobante.pk)

    contexto = {
        'detalles': detalles,
        'total': total,
    }

    return render(request, 'ventas/realizar_compra.html', contexto)

@login_required
def venta_realizada(request, pk):
    comprobante = get_object_or_404(ComprobanteVenta, pk=pk)
    detalles = DetalleCompra.objects.filter(compra=comprobante.compra)

    contexto = {
        'comprobante': comprobante,
        'detalles': detalles,
        'titulo': 'Comprobante de Venta'
    }

    return render(request, 'ventas/venta_realizada.html', contexto)