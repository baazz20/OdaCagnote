from django.urls import path
from api.views import NombreDePaiementPourRetardOuPourAvoirDitMr, NombreDePaiementPourRetardOuPourAvoirDitMrParDate

# urls pour aceder aux données de l'API
urlpatterns = [
    
    path('nbDPaiePrRtadEtAbs',NombreDePaiementPourRetardOuPourAvoirDitMr.as_view(), ),
    path('nbDPaiePrRtadEtAbsPRuneDatDnn/<jj>/<mm>/<AA>',NombreDePaiementPourRetardOuPourAvoirDitMrParDate.as_view(), )
]
