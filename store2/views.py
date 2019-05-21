from django.shortcuts import render
from django.views.generic import CreateView

# Create your views here.

from .models import User

from django.http import HttpResponse

def index(request):
  return HttpResponse("Hello world!")

def newPage(request):
	return HttpResponse("Pagina Nueva!")

def AddNewUser(CreateView, request):
	model = User
	fields = ('user_id', 'name', 'last_name', 'email', 'phone', 'user_name', 'password')
	return render(request ,'templates/user_forms.html')

	