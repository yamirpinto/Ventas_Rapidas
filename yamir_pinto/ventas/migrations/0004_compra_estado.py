# Generated by Django 4.2.2 on 2023-06-23 01:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ventas', '0003_alter_producto_imagen'),
    ]

    operations = [
        migrations.AddField(
            model_name='compra',
            name='estado',
            field=models.CharField(choices=[('activo', 'Activo'), ('completado', 'Completado')], default='activo', max_length=20),
        ),
    ]