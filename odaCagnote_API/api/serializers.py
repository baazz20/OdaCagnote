from rest_framework import serializers
from .models import *
from rest_framework.fields import CurrentUserDefault

class AcademicienSerializer(serializers.ModelSerializer):

	class Meta:
		model = Academicien
		exclude = 'status'

class PayementSerializer(serializers.ModelSerializer):
	

	class Meta:
		model = Payement
		exclude = 'status'

class MotifSerializer(serializers.ModelSerializer):

	class Meta:
		model = Motif
		exclude = ['lien']