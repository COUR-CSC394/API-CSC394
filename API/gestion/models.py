from django.db import models
from django.contrib.auth.models import User
from decimal import Decimal
from django.db.models import F



class Categorie(models.Model):
    nom = models.CharField(max_length=100)
    code = models.CharField(max_length=50)

    def __str__(self):
        return self.nom

class Produit(models.Model):
    nom = models.CharField(max_length=100)
    quantite = models.PositiveIntegerField()  # Quantité totale initiale
    quantite_disponible = models.PositiveIntegerField()  # Quantité disponible après les ventes
    description = models.TextField()
    image = models.URLField()
    seuil = models.PositiveIntegerField()
    prix_unitaire = models.DecimalField(max_digits=10, decimal_places=2)
    code = models.ForeignKey(Categorie, on_delete=models.CASCADE)

    @classmethod
    def rupture_stoks(cls):
        return cls.objects.filter(quantite__lte=F('seuil'))

    def __str__(self):
        return self.nom

class Vente(models.Model):
    quantite = models.PositiveIntegerField()
    prix = models.IntegerField()  # Changer le type en IntegerField
    date = models.DateField()
    code = models.ForeignKey(Produit, on_delete=models.CASCADE)

    def save(self, *args, **kwargs):
        produit = self.code
        quantite_vendue = self.quantite

        if produit.quantite_disponible >= quantite_vendue:
            produit.quantite_disponible -= quantite_vendue
            produit.save()
        else:
            raise ValueError("Quantité disponible insuffisante pour la vente.")

        super().save(*args, **kwargs)

    def __str__(self):
        return f"Vente of {self.quantite} units on {self.date}"

class Facture(models.Model):
    ventes = models.ManyToManyField(Vente)  # Many-to-many relationship with Vente
    numero = models.CharField(max_length=50, unique=True)
    prix_total = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"Facture {self.numero}"