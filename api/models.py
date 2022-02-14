from email.policy import default
from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


# Create your models here.

class Academicien(models.Model):
    matricule = models.CharField(max_length=6, unique=True)
    nom = models.CharField(max_length=50)
    prenoms = models.CharField(max_length=100)
    photo = models.ImageField(upload_to='images', default='', blank = True, null = True)
    def __str__(self):
        return self.nom +" "+self.prenoms  

class Motif(models.Model):
    libelle = models.CharField(max_length=200)
    def __str__(self):
        return self.libelle

class Payement(models.Model):
    id_academicien = models.ForeignKey(Academicien, on_delete=models.CASCADE)
    id_motif = models.ForeignKey(Motif, on_delete=models.CASCADE)
    date = models.DateField(auto_now_add=True)
    heure = models.TimeField(auto_now_add=True)
    montant = models.DecimalField(decimal_places=2, max_digits=5, validators=[MinValueValidator(0.01), MaxValueValidator(500)])
    def __str__(self):
        return "Payement de " + str(self.montant)
    class Meta:
        constraints = [models.UniqueConstraint(fields=['date', 'id_academicien', 'id_motif'], name='uniqueKey')]