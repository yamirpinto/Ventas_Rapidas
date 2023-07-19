from django.db import models
from django.contrib.auth.models import AbstractUser, Group, Permission
from ventas.models import Compra

# Create your models here.
class CustomUser(AbstractUser):
    groups = models.ManyToManyField(Group, related_name='customuser_set', blank=True)
    user_permissions = models.ManyToManyField(Permission, related_name='customuser_set', blank=True)
    carro_compras = models.OneToOneField(Compra, on_delete=models.CASCADE, null=True, blank=True)
    class Meta:
        permissions = [
            ("can_create_product", "Can create new product"),
            ("can_edit_product", "Can edit product"),
        ]
        default_related_name = "autenticacion_customuser"