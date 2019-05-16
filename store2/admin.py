# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import User, Item

# Register your models here.

admin.site.register(User)
admin.site.register(Item)

admin.site.site_header = "Sitio de administración Caed Store"
admin.site.site_title = "Caed"
admin.site.index_title = "Tienda En Linea"
