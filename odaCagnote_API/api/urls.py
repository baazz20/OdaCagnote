from django.urls import path,register_converter
from datetime import datetime
from . import views

class DateConverter:
    regex = '\d{4}-\d{2}-\d{2}'

    def to_python(self, value):
        return datetime.strptime(value, '%Y-%m-%d')

    def to_url(self, value):
        return value

register_converter(DateConverter, 'yyyy-mm-dd')


urlpatterns = [

    ######## 1ère fonctionnalité
    path('paiements/add/', views.postPayement,),
    path('paiements/', views.ListPayementAPIView.as_view(),),

    ########2ème
    path('academicien/add/', views.AcademicienViewSet.as_view(),),
    path('academicien/', views.AcademicienViewSet.as_view(),),
    path('academicien/one/<str:mat>', views.AcademicienViewSet.as_view(),),
    path('academicien/update/', views.AcademicienViewSet.as_view(),),
    path('academicien/destroy/<str:mat>', views.AcademicienViewSet.as_view(),),

    path('motif/add',views.MotifViewSet.as_view()),
    path('motif/', views.MotifViewSet.as_view(),),
    path('motif/update', views.MotifViewSet.as_view()),
    path('motif/destroy/<int:mat>', views.MotifViewSet.as_view()),

    ######### 3ème fonctionnalités
    path('paiement/<yyyy-mm-dd:date>',views.getPayementByDate),
    path('paiement/mat/<str:mat>',views.getPayementByMatricule),
    path('paiement/motif/<int:lib>',views.getPayementByMotif),
    path('paiement/<yyyy-mm-dd:date>/<str:mat>/<str:lib>', views.getPayement),

    ####### 4ème fonctionnalité
    path('solde/<yyyy-mm-dd:date>',views.soldeDate),
    
    path('presence/', views.getNumberPresence),

]