from django.contrib import admin

# from django.contrib import admin
from .models import Funcionario, Usuario, Professor, Disciplina, Aluno, Livro, Turma, Matricula


admin.site.register(Funcionario)
admin.site.register(Usuario)
admin.site.register(Professor)
admin.site.register(Disciplina)
admin.site.register(Aluno)
admin.site.register(Livro)
admin.site.register(Matricula)
admin.site.register(Turma)