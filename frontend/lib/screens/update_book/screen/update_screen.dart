import 'package:flutter/material.dart';
import 'package:frontend/screens/update_book/widget/update_book_body.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateScreen extends StatelessWidget {
  static const String routeName = 'update-screen';

  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 11, 11),
        title: Text(
          'Update Book',
          style: GoogleFonts.sansita(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const SingleChildScrollView(
          child: UpdateBookBody(),
        ),
      ),
    );
  }
}
