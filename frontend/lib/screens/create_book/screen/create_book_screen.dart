import 'package:flutter/material.dart';
import 'package:frontend/screens/create_book/widgets/create_book_body.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBookScreen extends StatelessWidget {
  static const String routeName = 'create-book';

  const CreateBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        title: Text(
          'Upload New Book',
          style: GoogleFonts.sansita(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 11, 11),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const SingleChildScrollView(
          child: CreateBookBody(),
        ),
      ),
    );
  }
}
