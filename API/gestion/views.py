from rest_framework.views import APIView
from rest_framework.response import Response 
from rest_framework import status 
from .models import Categorie, Produit, Vente, Facture
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User
from rest_framework import generics, permissions
from rest_framework.authtoken.views import ObtainAuthToken

from .forms import (
    CategorieSerializer,
    ProduitSerializer,
    VenteSerializer,
    FactureSerializer,
    UserSerializer,
)
from django.http import Http404

class UserRegistrationView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer  # Define your user serializer
    permission_classes = (permissions.AllowAny,)

class CustomAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        token = Token.objects.get(key=response.data['token'])
        return Response({'token': token.key, 'user_id': token.user_id})


# Categorie Views
class CategorieListCreateAPIView(APIView):
    def get(self, request):
        categories = Categorie.objects.all()
        serializer = CategorieSerializer(categories, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = CategorieSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CategorieDetailAPIView(APIView):
    def get_object(self, pk):
        try:
            return Categorie.objects.get(pk=pk)
        except Categorie.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        categorie = self.get_object(pk)
        serializer = CategorieSerializer(categorie)
        return Response(serializer.data)

    def put(self, request, pk):
        categorie = self.get_object(pk)
        serializer = CategorieSerializer(categorie, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        categorie = self.get_object(pk)
        categorie.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# Produit Views
class ProduitListCreateAPIView(APIView):
    def get(self, request):
        produits = Produit.objects.all()
        serializer = ProduitSerializer(produits, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = ProduitSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ProduitDetailAPIView(APIView):
    def get_object(self, pk):
        try:
            return Produit.objects.get(pk=pk)
        except Produit.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        produit = self.get_object(pk)
        serializer = ProduitSerializer(produit)
        return Response(serializer.data)

    def put(self, request, pk):
        produit = self.get_object(pk)
        serializer = ProduitSerializer(produit, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        produit = self.get_object(pk)
        produit.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
# Vente Views
class VenteListCreateAPIView(APIView):
    def get(self, request):
        ventes = Vente.objects.all()
        serializer = VenteSerializer(ventes, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = VenteSerializer(data=request.data)
        if serializer.is_valid():
            vente = serializer.save()

            # Calculer le prix en fonction de la quantité et du prix unitaire du produit
            produit = vente.code  # Code du produit vendu
            quantite_vendue = vente.quantite  # Quantité vendue dans la vente
            prix_unitaire = produit.prix_unitaire

            montant_total = quantite_vendue * prix_unitaire
            vente.prix = montant_total
            vente.save()

            # Décrémenter la quantité disponible du produit
            if produit.quantite_disponible >= quantite_vendue:
                produit.quantite_disponible -= quantite_vendue
                produit.save()
            else:
                vente.delete()  # Annuler la vente si la quantité n'est pas disponible
                return Response({'error': 'Quantité disponible insuffisante pour la vente.'}, status=status.HTTP_400_BAD_REQUEST)

            # vente.save()

            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class VenteDetailAPIView(APIView):
    def get_object(self, pk):
        try:
            return Vente.objects.get(pk=pk)
        except Vente.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        vente = self.get_object(pk)
        serializer = VenteSerializer(vente)
        return Response(serializer.data)

    def put(self, request, pk):
        vente = self.get_object(pk)
        serializer = VenteSerializer(vente, data=request.data)
        if serializer.is_valid():
            ancienne_quantite = vente.quantite  # Quantité avant la mise à jour
            nouvelle_quantite = serializer.validated_data.get('quantite')  # Nouvelle quantité dans la vente
            if nouvelle_quantite > ancienne_quantite:
                # Gérer la décrémentation de la quantité disponible du produit
                produit = vente.produit
                quantite_decrement = nouvelle_quantite - ancienne_quantite
                if produit.quantite_disponible >= quantite_decrement:
                    produit.quantite_disponible -= quantite_decrement
                    produit.save()
                else:
                    return Response({'error': 'Quantité disponible insuffisante pour la vente.'},
                                    status=status.HTTP_400_BAD_REQUEST)

            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        vente = self.get_object(pk)
        # Restaurer la quantité disponible du produit lié en cas de suppression de la vente
        produit = vente.produit
        produit.quantite_disponible += vente.quantite
        produit.save()

        vente.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# Facture Views
class FactureListCreateAPIView(APIView):
    def get(self, request):
        factures = Facture.objects.all()
        serializer = FactureSerializer(factures, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = FactureSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class FactureDetailAPIView(APIView):
    def get_object(self, pk):
        try:
            return Facture.objects.get(pk=pk)
        except Facture.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        facture = self.get_object(pk)
        serializer = FactureSerializer(facture)
        return Response(serializer.data)

    def put(self, request, pk):
        facture = self.get_object(pk)
        serializer = FactureSerializer(facture, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        facture = self.get_object(pk)
        facture.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    
