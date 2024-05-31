from django.contrib import admin
from .models import Funcionario, Usuario, Professor, Disciplina, Aluno, Livro, Turma, Matricula

class TurmaAdmin(admin.ModelAdmin):
    list_display = ['nome_turma', 'professor_turma', 'alunos_matriculados']

    def alunos_matriculados(self, obj):
        return ", ".join([aluno.nome_aluno for aluno in obj.alunos_turma.all()])
    alunos_matriculados.short_description = 'Alunos Matriculados'

admin.site.register(Funcionario)
admin.site.register(Usuario)
admin.site.register(Professor)
admin.site.register(Disciplina)
admin.site.register(Aluno)
admin.site.register(Livro)
admin.site.register(Matricula)
admin.site.register(Turma, TurmaAdmin)
