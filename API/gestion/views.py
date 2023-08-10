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
