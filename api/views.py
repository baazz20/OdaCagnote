from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from api.models import Academicien, Motif, Payement

def index(request):
    return render(request, "api/index.html")

    
'''Class qui retourne le nombre de payement pour retart ou pour avoir dit Mr'''


class NombreDePaiementPourRetardOuPourAvoirDitMr(APIView):
    def get(self, request):
        nombreRetardEtMr = {}
        nombreRetardEtMr["Retard"] = Payement.objects.filter(id_motif=Motif.objects.filter(
            libelle='Retard').values_list('id', flat=True).first()).count()
        nombreRetardEtMr["Mr"] = Payement.objects.filter(id_motif=Motif.objects.filter(
            libelle='Mr').values_list('id', flat=True).first()).count()

        return Response(nombreRetardEtMr)


'''Class qui retourne le nombre de payement pour retart ou pour avoir dit Mr dans une date donnée'''


class NombreDePaiementPourRetardOuPourAvoirDitMrParDate(APIView):
    def get(self, request, jj, mm, AA):
        nombreRetardEtMrAuneDateDonne = {}
        slug = AA+'-'+mm+'-'+jj
        nombreRetardEtMrAuneDateDonne["Retard"] = Payement.objects.filter(date=slug, id_motif=Motif.objects.filter(
            libelle='Retard').values_list('id', flat=True).first()).count()
        nombreRetardEtMrAuneDateDonne["Mr"] = Payement.objects.filter(date=slug, id_motif=Motif.objects.filter(
            libelle='Mr').values_list('id', flat=True).first()).count()
        return Response(nombreRetardEtMrAuneDateDonne)
