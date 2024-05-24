from django.db import models
from django.core.validators import RegexValidator

class Funcionario(models.Model):
    id_funcionario = models.AutoField(primary_key=True)
    nome_funcionario = models.CharField(max_length=150, default='')
    cpf_regex = RegexValidator(regex=r'^\d{3}\.\d{3}\.\d{3}-\d{2}$',
                               message="O formato do CPF deve ser XXX.XXX.XXX-XX")
    cpf_funcionario = models.CharField(max_length=14, validators=[cpf_regex], default='000.000.000-00')
    telefone_regex = RegexValidator(regex=r'^\(\d{2}\) \d{4,5}-\d{4}$',
                                    message="O formato do telefone deve ser (XX)XXXXX-XXXX")
    fone_funcionario = models.CharField(max_length=15, validators=[telefone_regex])
    email_funcionario = models.EmailField(max_length=100, default='')

    def __str__(self):
        return f'ID_Funcionario: {self.id_funcionario} | Nome: {self.nome_funcionario}'

class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nome_usuario = models.CharField(max_length=150, default='')
    cpf_regex = RegexValidator(regex=r'^\d{3}\.\d{3}\.\d{3}-\d{2}$',
                               message="O formato do CPF deve ser XXX.XXX.XXX-XX")
    cpf_usuario = models.CharField(max_length=14, validators=[cpf_regex], default='000.000.000-00')
    telefone_regex = RegexValidator(regex=r'^\(\d{2}\) \d{4,5}-\d{4}$',
                                    message="O formato do telefone deve ser (XX) XXXX-XXXX ou (XX) XXXXX-XXXX")
    fone_usuario = models.CharField(max_length=15, validators=[telefone_regex])
    email_usuario = models.EmailField(max_length=100, default='')
    idade_usuario = models.IntegerField(default=0)

    def __str__(self):
        return f'ID_Usuario: {self.id_usuario} | Nome: {self.nome_usuario}'

class Livro(models.Model):
    id_livro = models.AutoField(primary_key=True)
    nome_livro = models.CharField(max_length=150, default='')
    autor_livro = models.CharField(max_length=150, default='')
    edicao = models.IntegerField(default=1)
    quantidade_exemplares = models.IntegerField(default=0)

    def __str__(self):
        return f'ID_Livro: {self.id_livro} | Título: {self.nome_livro}'
