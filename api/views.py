from urllib import response
from django.db.models import Avg, Count, Min, Sum
from django.http import HttpResponse
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from api.models import Academicien, Motif, Payement
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import serializers
from rest_framework import status
from django.shortcuts import get_object_or_404
from rest_framework.generics import ListAPIView
from rest_framework.generics import CreateAPIView
from rest_framework.generics import DestroyAPIView
from rest_framework.generics import UpdateAPIView
from api.serializers import AcademicienSerializer, MotifSerializer, PayementSerializer


def index(request):
    return render(request, "api/index.html")


class NombreDePaiementPourRetardOuPourAvoirDitMr(APIView):
    '''Class qui retourne le nombre de payement pour retart ou pour avoir dit Mr'''

    def get(self, request):
        nombreRetardEtMr = {}
        nombreRetardEtMr["Retard"] = Payement.objects.filter(id_motif=Motif.objects.filter(
            libelle='Retard').values_list('id', flat=True).first()).count()
        nombreRetardEtMr["Mr"] = Payement.objects.filter(id_motif=Motif.objects.filter(
            libelle='Mr').values_list('id', flat=True).first()).count()

        return Response(nombreRetardEtMr)


class NombreDePaiementPourRetardOuPourAvoirDitMrParDate(APIView):
    '''Class qui retourne le nombre de payement pour retart ou pour avoir dit Mr dans une date donnée'''

    def get(self, request, jj, mm, AA):
        nombreRetardEtMrAuneDateDonne = {}
        slug = AA+'-'+mm+'-'+jj
        nombreRetardEtMrAuneDateDonne["Retard"] = Payement.objects.filter(date=slug, id_motif=Motif.objects.filter(
            libelle='Retard').values_list('id', flat=True).first()).count()
        nombreRetardEtMrAuneDateDonne["Mr"] = Payement.objects.filter(date=slug, id_motif=Motif.objects.filter(
            libelle='Mr').values_list('id', flat=True).first()).count()
        return Response(nombreRetardEtMrAuneDateDonne)

# CRUD ACADEMICIEN


class ListAcademicienAPIView(ListAPIView):
    """List des Academiciens disponible dans la table"""
    queryset = Academicien.objects.all()
    serializer_class = AcademicienSerializer


class CreateAcademicienAPIView(CreateAPIView):
    """Ajouter un nouveau Academicien"""
    queryset = Academicien.objects.all()
    serializer_class = AcademicienSerializer


class UpdateAcademicienAPIView(UpdateAPIView):
    """mettre à jours les informations d'un academicien"""
    queryset = Academicien.objects.all()
    serializer_class = AcademicienSerializer


class DeleteAcademicienAPIView(DestroyAPIView):
    """Suprimer un academicien"""
    queryset = Academicien.objects.all()
    serializer_class = AcademicienSerializer


# CRUD MOTIF
class ListMotifAPIView(ListAPIView):
    """List des motifs disponible dans la bd"""
    queryset = Motif.objects.all()
    serializer_class = MotifSerializer


class CreateMotifAPIView(CreateAPIView):
    """Ajouter un nouveau Motif"""
    queryset = Motif.objects.all()
    serializer_class = MotifSerializer


class UpdateMotifAPIView(UpdateAPIView):
    """mettre à jours les informations d'un Motif"""
    queryset = Motif.objects.all()
    serializer_class = MotifSerializer


class DeleteMotifAPIView(DestroyAPIView):
    """Suprimer un Motif"""
    queryset = Motif.objects.all()
    serializer_class = MotifSerializer


# CRUD Payement
class ListPayementAPIView(ListAPIView):
    """List des Payements disponible dans la bd"""
    queryset = Payement.objects.all()
    serializer_class = PayementSerializer


class CreatePayementAPIView(CreateAPIView):
    """Ajouter un nouveau Payement"""
    queryset = Payement.objects.all()
    serializer_class = PayementSerializer


class UpdatePayementAPIView(UpdateAPIView):
    """mettre à jours les informations d'un Payement"""
    queryset = Payement.objects.all()
    serializer_class = PayementSerializer


class DeletePayementAPIView(DestroyAPIView):
    """Suprimer un Payement"""
    queryset = Payement.objects.all()
    serializer_class = PayementSerializer

class ClassementParPaiementAPIView(APIView):

 #Classement des payement par montant
    def get(self, request):
        result=[]
        queryset=Payement.objects.select_related("id_academicien").all()
        # serializer = PayementSerializer(queryset, many=True)
        # i=Payement.objects.select_related("id_academicien").all().count()-1
        # while i>0:
        #     for p in queryset:
        #         result.append(p.nom)
        #     i=i-1
            
        for i in queryset:
            # result.append(i.nom)
            result.append(i.montant)

        return Response(result)
    #
    # def get(self, request):
    #     result=[]
    #     for p in  Payement.objects.raw('SELECT * FROM api_payement INNER JOIN api_academicien ON api_payement.id_academicien = api_academicien.id'):
    #         result.append(p.nom)
    #     return Response(result)

# class ClassementParPaiementAPIView(ListAPIView):
#     """List des Payements disponible dans la bd"""
#     queryset=Payement.objects.select_related("id_academicien").all()
#     # queryset= Academicien.objects.annotate(montant=Sum("payement__montant"))
#     serializer_class = PayementSerializer