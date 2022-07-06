import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconTextButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;

  const CustomIconTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              size: 28,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
