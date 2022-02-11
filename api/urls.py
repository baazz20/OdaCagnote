
from django.urls import path
from api.views import ClassementParPaiementAPIView, CreateMotifAPIView, CreatePayementAPIView, DeleteAcademicienAPIView, DeleteMotifAPIView, DeletePayementAPIView, ListMotifAPIView, ListPayementAPIView, NombreDePaiementPourRetardOuPourAvoirDitMr,CreateAcademicienAPIView,ListAcademicienAPIView, NombreDePaiementPourRetardOuPourAvoirDitMrParDate, UpdateAcademicienAPIView, UpdateMotifAPIView, UpdatePayementAPIView

# urls pour aceder aux données de l'API
urlpatterns = [
    # endpoint academicien
    path('list_academicien/',ListAcademicienAPIView.as_view()),
    path('mettreAjouAca/<int:pk>/',UpdateAcademicienAPIView.as_view()),
    path('suprimeAcademicien/<int:pk>/',DeleteAcademicienAPIView.as_view()),
    path('ajoutAcademicien/',CreateAcademicienAPIView.as_view()),

    # endpoint motif
    path('list_motif/',ListMotifAPIView.as_view()),
    path('mettreAjouMotif/<int:pk>/',UpdateMotifAPIView.as_view()),
    path('suprimeMotif/<int:pk>/',DeleteMotifAPIView.as_view()),
    path('ajoutMotif/',CreateMotifAPIView.as_view()),

    # endpoint Payement
    path('list_Payement/',ListPayementAPIView.as_view()),
    path('mettreAjouPayement/<int:pk>/',UpdatePayementAPIView.as_view()),
    path('suprimePayement/<int:pk>/',DeletePayementAPIView.as_view()),
    path('ajoutPayement/',CreatePayementAPIView.as_view()),


    path('ClassementParPaiement/',ClassementParPaiementAPIView.as_view()),

    # endpoint Calculs
    path('nbDPaiePrRtadEtAbs',NombreDePaiementPourRetardOuPourAvoirDitMr.as_view(), ),
    path('nbDPaiePrRtadEtAbsPRuneDatDnn/<jj>/<mm>/<AA>',NombreDePaiementPourRetardOuPourAvoirDitMrParDate.as_view(), )
]
