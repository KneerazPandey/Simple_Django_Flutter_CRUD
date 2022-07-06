import 'dart:convert';

class Book {
  final int id;
  final int author;
  final String title;
  final String description;
  final String image;
  final String language;
  final String price;
  final String published_date;

  const Book({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.image,
    required this.language,
    required this.price,
    required this.published_date,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? 0,
      author: map['author'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      language: map['language'] ?? '',
      price: map['price'] ?? '',
      published_date: map['published_date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'description': description,
      'image': image,
      'language': language,
      'price': price,
      'published_date': published_date,
    };
  }

  factory Book.fromJson(String source) {
    return Book.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
