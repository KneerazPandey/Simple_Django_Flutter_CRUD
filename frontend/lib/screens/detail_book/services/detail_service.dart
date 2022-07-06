import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:frontend/widgets/http_error_handling.dart';
import 'package:http/http.dart';

class DetailService {
  Future<void> deleteBook({
    required BuildContext context,
    required int bookId,
  }) async {
    try {
      final String url = "http://10.0.2.2:8000/books/$bookId/delete/";
      Uri uri = Uri.parse(url);
      Response response = await delete(uri);
      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          CustomSnackBar.showSnackBar(
            context: context,
            text: 'Book deleted sucessfully',
          );
        },
      );
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
