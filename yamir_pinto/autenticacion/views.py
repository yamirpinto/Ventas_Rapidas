from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .forms import FormularioEntrar, FormularioRegistro
from django.contrib.auth.models import User


def mostrar_login(request):
    form = FormularioEntrar(request.POST or None)
    if request.method == 'POST':
        username = request.POST['usuario']
        password = request.POST['contrasenia_usuario']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('mostrar_inicio')  # Cambiar 'mostrar_inicio' por la URL deseada después del login

    contexto = {
        'form': form,
        'titulo': 'Inicio de Sesión'
    }
    return render(request, 'autenticacion/login.html', contexto)

def logout_view(request):
    logout(request)
    return redirect('mostrar_inicio')

def mostrar_registro(request):
    if request.method == 'POST':
        form = FormularioRegistro(request.POST)
        if form.is_valid():
            form.save()
            return redirect('autenticacion:login')
    else:
        form = FormularioRegistro()
    contexto = {
        'form': form,
        'titulo': 'Registro de Usuarios'
    }
    return render(request, 'autenticacion/registro.html', contexto)

def mostrar_registro_admin(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password1']
        User.objects.create_superuser(username=username, email=email, password=password)
        return redirect('autenticacion:login')
    else:
        form = FormularioRegistro()
    contexto = {
        'form': form,
        'titulo': 'Registro de Administradores'
    }
    return render(request, 'autenticacion/registro_admin.html', contexto)
