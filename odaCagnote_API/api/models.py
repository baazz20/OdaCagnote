from email.policy import default
from django.db import models

# Create your models here.

class Academicien(models.Model):
    status = models.BooleanField(default = False,verbose_name="Statut du academicien")
    matricule = models.CharField(max_length=120, unique=True)
    nom = models.CharField(max_length=50)
    prenoms = models.CharField(max_length=100)
    photo = models.ImageField(upload_to='photo', default='', blank = True, null = True,)
    def __str__(self):
        return self.matricule   

class Motif(models.Model):
    status = models.BooleanField(default = False, verbose_name="Statut du motif")
    libelle = models.CharField(max_length=200)
    lien = models.ManyToManyField(Academicien, through = 'Payement', related_name='paiement', blank=True, verbose_name = 'Lien')
    def __str__(self):
        return self.libelle

class Payement(models.Model):
    date = models.DateField()
    heure = models.TimeField()
    montant = models.DecimalField(max_digits=8, decimal_places=2)
    id_academicien = models.ForeignKey(Academicien, related_name = 'pay_acad', on_delete = models.CASCADE)
    id_motif = models.ForeignKey(Motif, related_name = 'pay_motif', on_delete = models.CASCADE)

    class Meta:
        constraints = [models.UniqueConstraint(fields=['date', 'id_academicien', 'id_motif'], name='uniqueKey')]