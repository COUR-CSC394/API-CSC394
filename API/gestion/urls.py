from django.urls import path
from .views import (
    CategorieListCreateAPIView,
    CategorieDetailAPIView)

urlpatterns = [
    path('categories/', CategorieListCreateAPIView.as_view(), name='categorie-list-create'),
    path('categories/<int:pk>/', CategorieDetailAPIView.as_view(), name='categorie-detail'),
]