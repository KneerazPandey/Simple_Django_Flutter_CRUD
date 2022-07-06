import 'dart:convert';

import 'package:http/http.dart';

class BookService {
  Future<List> getAllBooks() async {
    const String url = "http://10.0.2.2:8000/books/";
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    return json.decode(response.body) as List;
  }
}
