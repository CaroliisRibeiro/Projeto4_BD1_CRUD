from django.urls import path
from . import views
from .views import visualizar_alunos_matriculados

urlpatterns = [
    path('dados/', views.get_funcionario_usuario_professor_aluno_disciplina_livros_turma, name='get_funcionario_usuario_profesor_aluno_disciplina_livros_turma'),

    path('funcionarios/', views.funcionario_list_create, name='funcionario-list-create'),
    path('funcionarios/<int:id_funcionario>/', views.funcionario_detail_update_delete, name='funcionario-detail-update-delete'),

    path('usuarios/', views.usuario_list_create, name='usuario-list-create'),
    path('usuarios/<int:id_usuario>/', views.usuario_detail_update_delete, name='usuario-detail-update-delete'),

    path('professores/', views.professor_list_create, name='professor-list-create'),
    path('professores/<int:id_prof>/', views.professor_detail_update_delete, name='professor-detail-update-delete'),

    path('disciplinas/', views.disciplina_list_create, name='disciplina-list-create'),
    path('disciplinas/<int:id_disciplina>/', views.disciplina_detail_update_delete, name='disciplina-detail-update-delete'),

    path('alunos/', views.aluno_list_create, name='aluno-list-create'),
    path('alunos/<int:id_aluno>/', views.aluno_detail_update_delete, name='aluno-detail-update-delete'),

    path('livros/', views.livro_list_create, name='livro-list-create'),
    path('livros/<int:id_livro>/', views.livro_detail_update_delete, name='livro-detail-update-delete'),
    
    path('turmas/', views.turma_list_create, name='turma-list-create'),
    path('turmas/<int:id_turma>/', views.turma_detail_update_delete, name='turma-detail-update-delete'),
    
    path('matriculas/', views.matricula_list_create, name='matricula-list-create'),
    path('matriculas/<int:pk>/', views.matricula_detail_update_delete, name='matricula-detail-update-delete'),
    path('turmas/<int:id_turma>/alunos/', views.alunos_por_turma, name='alunos-por-turma'),

]
