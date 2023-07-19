from django.forms import (
    Form,
    EmailField,
    EmailInput,
    CharField,
    PasswordInput,
    BooleanField,
    CheckboxInput,
    TextInput
)
from django.contrib.auth.forms import UserCreationForm #BaseUserCreationForm
from django.contrib.auth.models import User

class FormularioEntrar(Form):
    """
    <input name='correo_usuario' id='id_correo_usuario' type='email'
    class='form-control' placeholder='name@exaemple.com'
    >
    """
    # Se usa username para poder entrar
    usuario = CharField(
        min_length=1,
        max_length=16,
        required = True,
        label = 'Ingrese su usuario',
        widget = TextInput(
            attrs = {
                'class':'form-control',
                'placeholder':'Nombre de usuario'
            }
        )
    )
    email = CharField(
    min_length=1,
    max_length=16,
    required = True,
    label = 'Ingrese su correo',
    widget = TextInput(
        attrs = {
            'class':'form-control',
            'placeholder':'Correo'
            }
        )
    )
    contrasenia_usuario = CharField(
        required = True,
        min_length = 4,
        max_length = 16,
        label = 'Ingrese su contraseña',
        widget = PasswordInput(
            attrs = {
                'class': 'form-control',
                'placeholder': 'Password'
            }
        )
    )
    recuerdame = BooleanField(
        required = False,
        label = 'Recordarme',
        widget = CheckboxInput(
            
        )
    )
# class Nombre extends Padre {} 
# public Nombre(){}
# this
class FormularioRegistro(UserCreationForm):
    def __init__(self, *args, **kargs):
        super().__init__(*args,**kargs)
        self.fields['password1'].widget.attrs = {'class':'form-control'}
        self.fields['password2'].widget.attrs = {'class':'form-control'}
    class Meta:
        model = User
        fields = [
            'username',
            'email',
            'password1', # Son del padre, no del modelo
            'password2' # Son del padre, no del modelo
        ]
        widgets = {
            'username': TextInput(attrs = {'class':'form-control'}),
            'email': EmailInput(attrs={'class':'form-control'})
        }



