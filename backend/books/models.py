from django.db import models
from authentication.models import User


class Book(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=80)
    description = models.TextField(null=True, blank=True)
    image = models.ImageField(upload_to='books')
    language = models.CharField(max_length=30)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    published_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.title} by {self.author}'
