from django.conf.urls import url

from . import views

urlpatterns = [
  url(r'^$', views.index, name='index'),
  url(r'^newPage/$', views.newPage, name='newPage'),
  url(r'^AddUser/$', views.AddNewUser, name= "AddUser")

]