from django.shortcuts import render
from django.views.generic import CreateView

# Create your views here.

from .models import User, Item

from django.http import HttpResponse

def index(request):
	
	recent_items_list = Item.objects.all()
	context = {'recent_items_list': recent_items_list}

 	return render(request, 'store2/index.html', context)

def newPage(request):
	return HttpResponse("Pagina Nueva!")

def AddNewUser(CreateView, request):
	model = User
	fields = ('user_id', 'name', 'last_name', 'email', 'phone', 'user_name', 'password')
	return render(request ,'templates/user_forms.html')

def login(request):
	return render(request, 'store2/login.html')

def singup2(request, name, last_name, email, phone, user_name, password):
	context = {'name': name, 'last_name': last_name, 'email':email, 'phone':phone, 'user_name':user_name, 'password': password}

	q = User(name = name, last_name = last_name, email = email, phone = phone, user_name = user_name, password = password)
	q.save()

	print context
	return render(request, 'store2/index.html')

def singup(request):
	#context = {'user_id':user_id, 'name': name, 'last_name': last_name, 'email':email, 'phone':phone, 'user_name':user_name, 'password': password}
	return render(request, 'store2/singup.html')

def search(request, search_text):
	return render(request, 'store2/search.html', {'search_text' : search_text})

	