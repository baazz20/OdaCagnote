# Generated by Django 4.0.2 on 2022-02-18 18:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='academicien',
            name='status',
            field=models.BooleanField(default=False, verbose_name='Statut du academicien'),
        ),
        migrations.AddField(
            model_name='motif',
            name='status',
            field=models.BooleanField(default=False, verbose_name='Statut du motif'),
        ),
    ]
