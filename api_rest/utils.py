#from django.shortcuts import render
#from .models import Turma, AlunosTurma
#from .utils import listar_alunos_matriculados


#def detalhes_turma(request, turma_id):
    # Obtém a instância da turma com base no ID fornecido na URL
    #minha_turma = Turma.objects.get(id=turma_id)
    
    # Obtém os alunos associados a essa turma usando a função listar_alunos_matriculados()
    #alunos_da_turma = listar_alunos_matriculados(minha_turma.id)
    
    # Renderiza um template com os detalhes da turma e a lista de alunos
    #return render(request, 'detalhes_turma.html', {'turma': minha_turma, 'alunos': alunos_da_turma})


# utils.py


#def listar_alunos_matriculados(id_turma):
    #return AlunosTurma.listar_alunos_da_turma(id_turma)

