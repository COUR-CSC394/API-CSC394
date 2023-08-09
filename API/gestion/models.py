from django.db import models
from django.contrib.auth.models import User

class Categorie(models.Model):
    nom = models.CharField(max_length=100)
    code = models.CharField(max_length=50)

    def __str__(self):
        return self.nom

class Produit(models.Model):
    nom = models.CharField(max_length=100)
    quantité = models.PositiveIntegerField()
    description = models.TextField()
    image = models.URLField() 
    seuil = models.PositiveIntegerField()
    prix_unitaire = models.DecimalField(max_digits=10, decimal_places=2)
    code = models.ForeignKey(Categorie, on_delete=models.CASCADE)

    def __str__(self):
        return self.nom

class Vente(models.Model):
    quantité = models.PositiveIntegerField()
    prix = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()
    code = models.ForeignKey(Produit, on_delete=models.CASCADE)

    def __str__(self):
        return f"Vente of {self.quantité} units on {self.date}"

class Facture(models.Model):
    ventes = models.ManyToManyField(Vente)  # Many-to-many relationship with Vente
    numero = models.CharField(max_length=50, unique=True)
    prix_total = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"Facture {self.numero}"