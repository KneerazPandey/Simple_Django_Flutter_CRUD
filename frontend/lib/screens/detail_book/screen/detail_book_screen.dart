import 'package:flutter/material.dart';
import 'package:frontend/screens/detail_book/widgets/detail_book_body.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBookScreen extends StatelessWidget {
  static const String routeName = 'detail-book';

  const DetailBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 11, 11),
        title: Text(
          'Book Details',
          style: GoogleFonts.sansita(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: DetailBookBody(),
      ),
    );
  }
}
