from django import forms
from .models import Producto

class FormularioProducto(forms.ModelForm):

    class Meta:
        model = Producto
        fields = ('nombre', 'precio', 'cantidad_stock', 'imagen')


