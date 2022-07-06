import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frontend/controllers/controller.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class CreateBookService {
  Future<void> createBook({
    required BuildContext context,
    required String title,
    required String description,
    required String language,
    required String price,
    required File? bookImageFile,
  }) async {
    try {
      const String url = 'http://10.0.2.2:8000/books/create/';
      Uri uri = Uri.parse(url);
      MultipartRequest request = MultipartRequest('POST', uri);
      request.fields['author'] = userController.user.value.id;
      request.fields['title'] = title;
      request.fields['description'] = description;
      request.fields['language'] = language;
      request.fields['price'] = price;
      Uint8List data = await bookImageFile!.readAsBytes();
      List<int> imageList = data.cast();
      MultipartFile bookImage =
          MultipartFile.fromBytes('image', imageList, filename: '$title.png');
      request.files.add(bookImage);
      StreamedResponse response = await request.send();
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
