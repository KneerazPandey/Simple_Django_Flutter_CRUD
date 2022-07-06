import 'package:flutter/material.dart';
import 'package:frontend/screens/update_book/widget/update_book_form.dart';

class UpdateBookBody extends StatelessWidget {
  const UpdateBookBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Column(
        children: const [
          SizedBox(height: 30),
          UpdateBookForm(),
        ],
      ),
    );
  }
}
