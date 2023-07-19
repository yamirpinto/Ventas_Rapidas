from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


# Create your models here.
class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cantidad_stock = models.IntegerField()
    fecha_creacion = models.DateTimeField(default=timezone.now)  # Campo para almacenar la fecha de creación
    imagen = models.ImageField(upload_to='assets/img/', default='assets/img/default.jpg')  # Campo para almacenar la imagen en una ruta específica - Incluye ruta

class Compra(models.Model):
    ESTADO_CHOICES = (
        ('activo', 'Activo'),
        ('completado', 'Completado'),
    )
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha = models.DateTimeField(auto_now_add=True)
    productos = models.ManyToManyField(Producto, through='DetalleCompra')
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES, default='activo')


    def __str__(self):
        return f"Compra {self.id} - Usuario: {self.usuario.username}"

class DetalleCompra(models.Model):
    compra = models.ForeignKey(Compra, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField()

class ComprobanteVenta(models.Model):
    compra = models.OneToOneField(Compra, on_delete=models.CASCADE)
    total = models.DecimalField(max_digits=10, decimal_places=2)