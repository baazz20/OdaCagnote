from rest_framework import serializers

from api.models import Academicien, Motif, Payement

class AcademicienSerializer(serializers.ModelSerializer):
    class Meta:
        model = Academicien
        fields = '__all__'

class MotifSerializer(serializers.ModelSerializer):


    class Meta:
        model = Motif
        fields = '__all__'

class PayementSerializer(serializers.ModelSerializer):


    class Meta:
        model = Payement,
        fields = '__all__'
