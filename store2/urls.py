from django.conf.urls import url

from . import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

app_name = 'store2'

urlpatterns = [
  url(r'^$', views.index, name='index'),
  url(r'^newPage/$', views.newPage, name='newPage'),
  url(r'^AddUser/$', views.AddNewUser, name= "AddUser"),
  url(r'^login/$', views.login, name="login"),
  url(r'^singup/$', views.singup, name="singup"),
  url(r'^singup/name=(?P<name>[\s\S]+)&last_name=(?P<last_name>[\s\S]+)&email=(?P<email>[\s\S]+)&phone=(?P<phone>[\s\S]+)&user_name=(?P<user_name>[\s\S]+)&psw=(?P<password>[\s\S]+)&psw=([\s\S]+)&singupButton=Acceder', views.singup2, name = "singUp2"),
  url(r'^search_text=+(?P<search_text>[\s\S]+)&search=Ok', views.search, name = "search")
]

urlpatterns += staticfiles_urlpatterns()