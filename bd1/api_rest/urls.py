from django.urls import path
from . import views

urlpatterns = [
    # All data URL
    path('dados/', views.get_funcionario_usuario_livros, name='get_funcionario_usuario_livros'),

    # Funcionario URLs
    path('funcionarios/', views.funcionario_list_create, name='funcionario-list-create'),
    path('funcionarios/<int:id_funcionario>/', views.funcionario_detail_update_delete, name='funcionario-detail-update-delete'),

    # Usuario URLs
    path('usuarios/', views.usuario_list_create, name='usuario-list-create'),
    path('usuarios/<int:id_usuario>/', views.usuario_detail_update_delete, name='usuario-detail-update-delete'),

    # Livro URLs
    path('livros/', views.livro_list_create, name='livro-list-create'),
    path('livros/<int:id_livro>/', views.livro_detail_update_delete, name='livro-detail-update-delete'),
]
