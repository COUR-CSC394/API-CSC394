from django.urls import path
from .views import (
    CategorieListCreateAPIView,
    CategorieDetailAPIView,
    ProduitListCreateAPIView,
    ProduitDetailAPIView,
    VenteListCreateAPIView,
    VenteDetailAPIView,
    FactureListCreateAPIView,
    FactureDetailAPIView,
    UserRegistrationView,
    CustomAuthToken,
)

urlpatterns = [
    path('categories/', CategorieListCreateAPIView.as_view(), name='categorie-list-create'),
    path('categories/<int:pk>/', CategorieDetailAPIView.as_view(), name='categorie-detail'),
    path('produits/', ProduitListCreateAPIView.as_view(), name='produit-list-create'),
    path('produits/<int:pk>/', ProduitDetailAPIView.as_view(), name='produit-detail'),
    path('ventes/', VenteListCreateAPIView.as_view(), name='vente-list-create'),
    path('ventes/<int:pk>/', VenteDetailAPIView.as_view(), name='vente-detail'),
    path('factures/', FactureListCreateAPIView.as_view(), name='facture-list-create'),
    path('factures/<int:pk>/', FactureDetailAPIView.as_view(), name='facture-detail'),
    path('register/', UserRegistrationView.as_view(), name='user-register'),
    path('login/', CustomAuthToken.as_view(), name='user-login'),
]

