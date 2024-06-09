from django.db import models
from django.core.validators import RegexValidator
from django.http import JsonResponse


class Funcionario(models.Model):
    id_funcionario = models.AutoField(primary_key=True)
    nome_funcionario = models.CharField(max_length=150, default='')
    cpf_regex = RegexValidator(regex=r'^\d{3}\.\d{3}\.\d{3}-\d{2}$', message="O formato do CPF deve ser XXX.XXX.XXX-XX")
    cpf_funcionario = models.CharField(max_length=14, validators=[cpf_regex], default='000.000.000-00')
    telefone_regex = RegexValidator(regex=r'^\(\d{2}\)\d{4,5}-\d{4}$', message="O formato do telefone deve ser (XX)XXXXX-XXXX")
    fone_funcionario = models.CharField(max_length=15, validators=[telefone_regex], default='(00)00000-0000')
    email_funcionario = models.EmailField(max_length=100, default='')

    def __str__(self):
        return f'ID_Funcionario: {self.id_funcionario} | Nome: {self.nome_funcionario}'

class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nome_usuario = models.CharField(max_length=150, default='')
    cpf_regex = RegexValidator(regex=r'^\d{3}\.\d{3}\.\d{3}-\d{2}$', message="O formato do CPF deve ser XXX.XXX.XXX-XX")
    cpf_usuario = models.CharField(max_length=14, validators=[cpf_regex], default='000.000.000-00')
    telefone_regex = RegexValidator(regex=r'^\(\d{2}\)\d{4,5}-\d{4}$', message="O formato do telefone deve ser (XX)XXXXX-XXXX")
    fone_usuario = models.CharField(max_length=15, validators=[telefone_regex], default='(00)00000-0000')
    email_usuario = models.EmailField(max_length=100, default='')
    idade_usuario = models.IntegerField(default=0)

    def __str__(self):
        return f'ID_Usuario: {self.id_usuario} | Nome: {self.nome_usuario}'

class Professor(models.Model):
    id_prof = models.AutoField(primary_key=True)
    nome_prof = models.CharField(max_length=150, default='')
    cpf_regex = RegexValidator(regex=r'^\d{3}\.\d{3}\.\d{3}-\d{2}$', message="O formato do CPF deve ser XXX.XXX.XXX-XX")
    cpf_prof = models.CharField(max_length=14, validators=[cpf_regex], default='000.000.000-00')
    telefone_regex = RegexValidator(regex=r'^\(\d{2}\)\d{4,5}-\d{4}$', message="O formato do telefone deve ser (XX)XXXXX-XXXX")
    fone_prof = models.CharField(max_length=15, validators=[telefone_regex], default='(00)00000-0000')
    email_prof = models.EmailField(max_length=100, default='')
    idade_prof = models.IntegerField(default=0)

    def __str__(self):
        return f'ID_Professor: {self.id_prof} | Nome: {self.nome_prof}'

class Disciplina(models.Model):
    id_disciplina = models.AutoField(primary_key=True)
    nome_disciplina = models.CharField(max_length=150, default='')
    professor_disciplina = models.ForeignKey(Professor, on_delete=models.CASCADE)

    def __str__(self):
        return f'ID_Disciplina: {self.id_disciplina} | Nome: {self.nome_disciplina}'

class Aluno(models.Model):
    id_aluno = models.AutoField(primary_key=True)
    nome_aluno = models.CharField(max_length=150, default='')
    cpf_regex = RegexValidator(regex=r'^\d{3}\.\d{3}\.\d{3}-\d{2}$', message="O formato do CPF deve ser XXX.XXX.XXX-XX")
    cpf_aluno = models.CharField(max_length=14, validators=[cpf_regex], default='000.000.000-00')
    telefone_regex = RegexValidator(regex=r'^\(\d{2}\)\d{4,5}-\d{4}$', message="O formato do telefone deve ser (XX)XXXXX-XXXX")
    fone_aluno = models.CharField(max_length=15, validators=[telefone_regex], default='(00)00000-0000')
    email_aluno = models.EmailField(max_length=100, default='')
    idade_aluno = models.IntegerField(default=0)

    def __str__(self):
        return f'ID_Aluno: {self.id_aluno} | Nome: {self.nome_aluno}'

class Livro(models.Model):
    id_livro = models.AutoField(primary_key=True)
    nome_livro = models.CharField(max_length=150, default='')
    autor_livro = models.CharField(max_length=150, default='')
    edicao = models.IntegerField(default=1)
    quantidade_exemplares = models.IntegerField(default=0)
    descricao = models.TextField(default='')  # Campo de descrição adicionado

    def __str__(self):
        return f'ID_Livro: {self.id_livro} | Título: {self.nome_livro}'

class Turma(models.Model):
    MAX_ALUNOS = 30

    id_turma = models.AutoField(primary_key=True)
    nome_turma = models.CharField(max_length=150, default='')
    professor_turma = models.ForeignKey(Professor, on_delete=models.CASCADE)
    alunos_turma = models.ManyToManyField(Aluno, through='Matricula')

    def adicionar_aluno(self, aluno):
        if self.alunos_turma.count() >= self.MAX_ALUNOS:
            raise Exception("A turma já atingiu o limite máximo de alunos.")
        if Matricula.objects.filter(aluno=aluno).exists():
            raise Exception("O aluno já está matriculado em outra turma.")
        Matricula.objects.create(aluno=aluno, turma=self)

    def obter_alunos(self):
        return self.alunos_turma.all()

    def __str__(self):
        return f'ID_Turma: {self.id_turma} | Nome: {self.nome_turma}'

class Livro(models.Model):
    id_livro = models.AutoField(primary_key=True)
    nome_livro = models.CharField(max_length=150, default='')
    autor_livro = models.CharField(max_length=150, default='')
    edicao = models.IntegerField(default=1)
    quantidade_exemplares = models.IntegerField(default=0)
    descricao = models.TextField(default='')  # Adicione este campo
    


    def __str__(self):
        return f'ID_Livro: {self.id_livro} | Título: {self.nome_livro}'


class Turma(models.Model):
    MAX_ALUNOS = 30

    id_turma = models.AutoField(primary_key=True)
    nome_turma = models.CharField(max_length=150, default='')
    professor_turma = models.ForeignKey(Professor, on_delete=models.CASCADE)
    alunos_turma = models.ManyToManyField(Aluno, through='Matricula')

    def adicionar_aluno(self, aluno):
        if self.alunos_turma.count() >= self.MAX_ALUNOS:
            raise Exception("A turma já atingiu o limite máximo de alunos.")
        if aluno.matricula_set.exists():
            raise Exception("O aluno já está matriculado em outra turma.")
        self.alunos_turma.add(aluno)

    def obter_alunos(self):
        return self.alunos_turma.all()

    def __str__(self):
        return f'ID_Turma: {self.id_turma} | Nome: {self.nome_turma}'



class Matricula(models.Model):
    aluno = models.ForeignKey(Aluno, on_delete=models.CASCADE)
    turma = models.ForeignKey(Turma, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('aluno', 'turma')
