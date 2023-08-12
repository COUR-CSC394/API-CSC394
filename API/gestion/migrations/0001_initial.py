# Generated by Django 5.0.dev20230123092917 on 2023-08-12 11:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categorie',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=100)),
                ('code', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Produit',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=100)),
                ('quantite', models.PositiveIntegerField()),
                ('quantite_disponible', models.PositiveIntegerField()),
                ('description', models.TextField()),
                ('image', models.URLField()),
                ('seuil', models.PositiveIntegerField()),
                ('prix_unitaire', models.DecimalField(decimal_places=2, max_digits=10)),
                ('code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='gestion.categorie')),
            ],
        ),
        migrations.CreateModel(
            name='Vente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantite', models.PositiveIntegerField()),
                ('prix', models.DecimalField(decimal_places=2, max_digits=10)),
                ('date', models.DateField()),
                ('code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='gestion.produit')),
            ],
        ),
        migrations.CreateModel(
            name='Facture',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.CharField(max_length=50, unique=True)),
                ('prix_total', models.DecimalField(decimal_places=2, max_digits=10)),
                ('ventes', models.ManyToManyField(to='gestion.vente')),
            ],
        ),
    ]
