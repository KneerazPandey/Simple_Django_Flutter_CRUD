import 'package:flutter/material.dart';
import 'package:frontend/models/book.dart';
import 'package:frontend/screens/detail_book/services/detail_service.dart';
import 'package:frontend/screens/home/screen/home_screen.dart';
import 'package:frontend/screens/update_book/screen/update_screen.dart';
import 'package:frontend/widgets/custom_alert_dialog.dart';
import 'package:frontend/widgets/custom_icon_text_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBookBody extends StatelessWidget {
  final DetailService _detailService = DetailService();

  DetailBookBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Book book = ModalRoute.of(context)!.settings.arguments as Book;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('http://10.0.2.2:8000${book.image}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            children: [
              Text(
                book.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '\$ ${book.price}',
            style: GoogleFonts.poppins(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            book.description,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFFbebebe),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconTextButton(
                buttonName: 'Delete',
                onPressed: () {
                  CustomAlertDialog.showAlertDialog(
                    context: context,
                    title: 'Confirm Delete',
                    content: 'Are you sure you want to delete?',
                    firstAction: 'Cancel',
                    firstActionOnPressed: () {
                      Navigator.of(context).pop();
                    },
                    secondAction: 'Ok',
                    secondActionOnPressed: () async {
                      await _detailService.deleteBook(
                        context: context,
                        bookId: book.id,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.routeName,
                        (route) => false,
                      );
                    },
                  );
                },
                icon: Icons.delete,
                iconColor: Colors.red,
              ),
              CustomIconTextButton(
                buttonName: 'Update',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    UpdateScreen.routeName,
                    arguments: book,
                  );
                },
                icon: Icons.update,
                iconColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
