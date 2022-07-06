from django.urls import path
from . import views


urlpatterns = [
    path('', views.BookListAPIView.as_view()),
    path('<int:pk>/', views.BookRetriveAPIView.as_view()),

    path('create/', views.BookCreateAPIView.as_view()),
    
    path('<int:pk>/update/', views.BookUpdateAPIView.as_view()),
    path('<int:pk>/delete/', views.BookDestroyAPIView.as_view()),
]