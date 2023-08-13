from rest_framework import serializers
from .models import Categorie, Produit, Vente, Facture
from django.contrib.auth.models import User

class CategorieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categorie
        fields = '__all__'

class ProduitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produit
        fields = '__all__'

class VenteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vente
        fields = '__all__'

    prix = serializers.IntegerField(read_only=True)

    def validate_quantite(self, value):
        if value <= 0:
            raise serializers.ValidationError("La quantité doit être supérieure à zéro.")
        
        code = self.initial_data.get('code')
        produit = Produit.objects.get(pk=code)
        
        if value > produit.quantite:
            raise serializers.ValidationError("La quantité disponible est insuffisante pour cette vente.")
        
        return value

    def create(self, validated_data):
        code = validated_data.pop('code', None)
        
        if not code:
            raise serializers.ValidationError("Vous devez fournir le produit.")
        
        quantite = validated_data.pop('quantite')
        
        prix_unitaire = code.prix_unitaire
        prix_total = quantite * prix_unitaire
        
        vente = Vente.objects.create(code=code, quantite=quantite, prix=prix_total, **validated_data)

        # Décrémenter la quantité du produit vendu
        code.quantite -= quantite
        code.save()

        return vente


class FactureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Facture
        fields = '__all__'

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'email', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user


