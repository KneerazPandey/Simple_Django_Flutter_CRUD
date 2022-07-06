import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePickerButton extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final VoidCallback onPressed;

  const ImagePickerButton({
    Key? key,
    required this.buttonName,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 170,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 36, 36, 36),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              buttonName,
              style: GoogleFonts.poppins(
                color: const Color(0xFFbebebe),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
