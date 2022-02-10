from django.contrib import admin
from .models import Academicien, Motif, Payement
# Register your models here.

admin.site.register([Academicien, Motif, Payement])
