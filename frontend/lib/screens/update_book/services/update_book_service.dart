import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class UpdateBookService {
  Future<void> updateBook({
    required BuildContext context,
    required int bookId,
    required String title,
    required String description,
    required String language,
    required String price,
    required File? bookImageFile,
  }) async {
    try {
      final String url = "http://10.0.2.2:8000/books/$bookId/update/";
      Uri uri = Uri.parse(url);
      MultipartRequest multipartRequest = MultipartRequest('PUT', uri);
      multipartRequest.fields['title'] = title;
      multipartRequest.fields['description'] = description;
      multipartRequest.fields['language'] = language;
      multipartRequest.fields['price'] = price;
      if (bookImageFile != null) {
        Uint8List data = await bookImageFile.readAsBytes();
        List<int> imageList = data.cast();
        MultipartFile bookImage =
            MultipartFile.fromBytes('image', imageList, filename: '$title.png');
        multipartRequest.files.add(bookImage);
      }
      StreamedResponse response = await multipartRequest.send();
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
