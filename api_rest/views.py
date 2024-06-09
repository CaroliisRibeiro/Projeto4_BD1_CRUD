from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import Funcionario, Usuario, Professor, Disciplina, Aluno, Livro, Turma, Matricula
from .serializers import FuncionarioSerializer, UsuarioSerializer, ProfessorSerializer, DisciplinaSerializer, AlunoSerializer, LivroSerializer, TurmaSerializer, MatriculaSerializer
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.shortcuts import render
from sklearn.metrics.pairwise import linear_kernel
from django.core.mail import send_mail
from .models import Livro  # Importe o modelo Livro


@api_view(['GET'])
def get_funcionario_usuario_professor_aluno_disciplina_livros_turma(request):
    try:
        data = {}
        data['funcionarios'] = FuncionarioSerializer(Funcionario.objects.all(), many=True).data
        data['usuarios'] = UsuarioSerializer(Usuario.objects.all(), many=True).data
        data['professores'] = ProfessorSerializer(Professor.objects.all(), many=True).data
        data['alunos'] = AlunoSerializer(Aluno.objects.all(), many=True).data
        data['disciplinas'] = DisciplinaSerializer(Disciplina.objects.all(), many=True).data
        data['livros'] = LivroSerializer(Livro.objects.all(), many=True).data
        data['turmas'] = TurmaSerializer(Turma.objects.all(), many=True).data
        return Response(data)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def funcionario_list_create(request):
    if request.method == 'GET':
        funcionarios = Funcionario.objects.all()
        serializer = FuncionarioSerializer(funcionarios, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = FuncionarioSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def listar_alunos_por_turma(request, turma_id):
    try:
        turma = get_object_or_404(Turma, pk=turma_id)
        alunos = turma.alunos_turma.all()
        serializer = AlunoSerializer(alunos, many=True)
        return Response(serializer.data)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'PUT', 'DELETE'])
def funcionario_detail_update_delete(request, id_funcionario):
    try:
        funcionario = get_object_or_404(Funcionario, pk=id_funcionario)
        if request.method == 'GET':
            serializer = FuncionarioSerializer(funcionario)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = FuncionarioSerializer(funcionario, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            funcionario.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def usuario_list_create(request):
    if request.method == 'GET':
        usuarios = Usuario.objects.all()
        serializer = UsuarioSerializer(usuarios, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = UsuarioSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def usuario_detail_update_delete(request, id_usuario):
    try:
        usuario = get_object_or_404(Usuario, pk=id_usuario)
        if request.method == 'GET':
            serializer = UsuarioSerializer(usuario)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = UsuarioSerializer(usuario, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            usuario.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def professor_list_create(request):
    if request.method == 'GET':
        professores = Professor.objects.all()
        serializer = ProfessorSerializer(professores, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = ProfessorSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def professor_detail_update_delete(request, id_prof):
    try:
        professor = get_object_or_404(Professor, pk=id_prof)
        if request.method == 'GET':
            serializer = ProfessorSerializer(professor)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = ProfessorSerializer(professor, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            professor.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def disciplina_list_create(request):
    if request.method == 'GET':
        disciplinas = Disciplina.objects.all()
        serializer = DisciplinaSerializer(disciplinas, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = DisciplinaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def disciplina_detail_update_delete(request, id_disciplina):
    try:
        disciplina = get_object_or_404(Disciplina, pk=id_disciplina)
        if request.method == 'GET':
            serializer = DisciplinaSerializer(disciplina)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = DisciplinaSerializer(disciplina, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            disciplina.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def aluno_list_create(request):
    if request.method == 'GET':
        alunos = Aluno.objects.all()
        serializer = AlunoSerializer(alunos, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = AlunoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def aluno_detail_update_delete(request, id_aluno):
    try:
        aluno = get_object_or_404(Aluno, pk=id_aluno)
        if request.method == 'GET':
            serializer = AlunoSerializer(aluno)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = AlunoSerializer(aluno, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            aluno.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def livro_list_create(request):
    if request.method == 'GET':
        livros = Livro.objects.all()
        serializer = LivroSerializer(livros, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = LivroSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def livro_detail_update_delete(request, id_livro):
    try:
        livro = get_object_or_404(Livro, pk=id_livro)
        if request.method == 'GET':
            serializer = LivroSerializer(livro)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = LivroSerializer(livro, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            livro.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def turma_list_create(request):
    if request.method == 'GET':
        turmas = Turma.objects.all()
        serializer = TurmaSerializer(turmas, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = TurmaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def turma_detail_update_delete(request, id_turma):
    try:
        turma = get_object_or_404(Turma, pk=id_turma)
        if request.method == 'GET':
            serializer = TurmaSerializer(turma)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = TurmaSerializer(turma, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            turma.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def matricula_list_create(request):
    if request.method == 'GET':
        matriculas = Matricula.objects.all()
        serializer = MatriculaSerializer(matriculas, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = MatriculaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def matricula_detail_update_delete(request, pk):
    try:
        matricula = get_object_or_404(Matricula, pk=pk)
        if request.method == 'GET':
            serializer = MatriculaSerializer(matricula)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = MatriculaSerializer(matricula, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif request.method == 'DELETE':
            matricula.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def alunos_por_turma(request, id_turma):
    try:
        turma = get_object_or_404(Turma, pk=id_turma)
        alunos = turma.alunos_turma.all()
        serializer = AlunoSerializer(alunos, many=True)
        return Response(serializer.data)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def visualizar_alunos_matriculados(request):
    turmas = Turma.objects.all()
    data = {turma.nome_turma: [aluno.nome_aluno for aluno in turma.alunos_turma.all()] for turma in turmas}
    return Response(data)

def listar_alunos_por_turma(request, turma_id):
    try:
        turma = get_object_or_404(Turma, pk=turma_id)
        alunos = turma.alunos_turma.all()
        alunos_list = [{"id": aluno.id, "nome": aluno.nome} for aluno in alunos]
        return JsonResponse(alunos_list, safe=False)
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)
    
    

def obter_sugestoes_de_livros():
    # Obtenha os últimos 5 livros adicionados como sugestões
    sugestoes = Livro.objects.order_by('-id')[:5]

    # Agora você pode retornar essas sugestões
    return sugestoes



def email_view(request):
    # Lógica para obter sugestões de livros
    sugestoes = obter_sugestoes_de_livros()

    # Lógica para determinar os destinatários do e-mail
    # Aqui você pode obter os e-mails dos destinatários, por exemplo, de um modelo de usuário
    destinatarios = ['exemplo1@email.com', 'exemplo2@email.com']  # Substitua pelos e-mails reais dos destinatários

    # Chame a função para enviar as sugestões por e-mail
    enviar_sugestoes_por_email(destinatarios, sugestoes)

    return render(request, 'template.html', {'sugestoes': sugestoes})
