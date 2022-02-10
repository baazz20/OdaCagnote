from email.policy import default
from django.db import models

# Create your models here.

class Academicien(models.Model):
    id = models.IntegerField(primary_key=True, editable=False)
    matricule = models.CharField(max_length=6, unique=True)
    nom = models.CharField(max_length=50)
    prenoms = models.CharField(max_length=100)
    photo = models.ImageField(upload_to='images', default='')
    def __str__(self):
        return self.matricule   

class Motif(models.Model):
    id = models.IntegerField(primary_key=True, editable=False)
    libelle = models.CharField(max_length=200)
    def __str__(self):
        return self.libelle

class Payement(models.Model):
    id = models.IntegerField(primary_key=True, editable=False)
    id_academicien = models.IntegerField()
    id_motif = models.IntegerField()
    date = models.DateField()
    heure = models.TimeField()
    montant = models.DecimalField(max_digits=8, decimal_places=2)
    class Meta:
        constraints = [models.UniqueConstraint(fields=['date', 'id_academicien', 'id_motif'], name='uniqueKey')]