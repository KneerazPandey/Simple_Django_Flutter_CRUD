from rest_framework.response import Response
from rest_framework import status, generics
from . serializers import BookSerializer
from . models import Book


class BookListAPIView(generics.GenericAPIView):
    serializer_class = BookSerializer

    def get(self, request):
        books = Book.objects.all()
        serializer = self.serializer_class(books, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class BookRetriveAPIView(generics.GenericAPIView):
    serializer_class = BookSerializer

    def get(self, request, pk):
        try:
            book = Book.objects.get(id=pk)
            serializer = self.serializer_class(book, many=False)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Book.DoesNotExist:
            return Response({'error': 'The book you are searching for does not exist'}, status=status.HTTP_404_NOT_FOUND)


class BookCreateAPIView(generics.GenericAPIView):
    serializer_class = BookSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class BookUpdateAPIView(generics.GenericAPIView):
    serializer_class = BookSerializer

    def put(self, request, pk):
        try:
            book = Book.objects.get(id=pk)
            serializer = self.serializer_class(book, data=request.data, partial=True)
            if serializer.is_valid(raise_exception=True):
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Book.DoesNotExist:
            return Response({'error': 'The book you are searching for does not exist'}, status=status.HTTP_404_NOT_FOUND)


class BookDestroyAPIView(generics.GenericAPIView):
    serializer_class = BookSerializer

    def delete(self, request, pk):
        try:
            book = Book.objects.get(id=pk)
            book.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        except Book.DoesNotExist:
            return Response({'error': 'The book you are searching for does not exist'}, status=status.HTTP_404_NOT_FOUND)