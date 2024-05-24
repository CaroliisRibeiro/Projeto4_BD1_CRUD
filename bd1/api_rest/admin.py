from django.contrib import admin

# Register your models here.
from .models import Usuario, Funcionario, Livro
admin.site.register(Usuario)
admin.site.register(Funcionario)
admin.site.register(Livro)


