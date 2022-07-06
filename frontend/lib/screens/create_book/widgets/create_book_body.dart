import 'package:flutter/material.dart';
import 'package:frontend/screens/create_book/widgets/create_book_form.dart';

class CreateBookBody extends StatelessWidget {
  const CreateBookBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 20),
          CreateBookForm(),
        ],
      ),
    );
  }
}
