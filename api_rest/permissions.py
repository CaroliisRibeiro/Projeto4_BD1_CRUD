from rest_framework import permissions
from .models import UserRole

class IsAdminOrReadOnly(permissions.BasePermission):
    """
    Permissão que permite apenas a administradores editarem objetos.
    """

    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user.is_authenticated and UserRole.objects.filter(user=request.user, role__role_name='Admin').exists()

class IsFuncionarioOrReadOnly(permissions.BasePermission):
    """
    Permissão que permite apenas funcionários editarem objetos.
    """

    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user.is_authenticated and UserRole.objects.filter(user=request.user, role__role_name='Funcionario').exists()

class IsProfessorOrReadOnly(permissions.BasePermission):
    """
    Permissão que permite apenas professores editarem objetos.
    """

    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user.is_authenticated and UserRole.objects.filter(user=request.user, role__role_name='Professor').exists()
