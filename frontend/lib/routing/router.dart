import 'package:flutter/material.dart';
import 'package:frontend/screens/create_book/screen/create_book_screen.dart';
import 'package:frontend/screens/detail_book/screen/detail_book_screen.dart';
import 'package:frontend/screens/home/screen/home_screen.dart';
import 'package:frontend/screens/log_in/screen/log_in_screen.dart';
import 'package:frontend/screens/sign_up/screen/sign_up_screen.dart';
import 'package:frontend/screens/update_book/screen/update_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Route<dynamic> generateRoute({required RouteSettings routeSettings}) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const SignUpScreen(),
      );
    case LogInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const LogInScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const HomeScreen(),
      );
    case CreateBookScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const CreateBookScreen(),
      );
    case DetailBookScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const DetailBookScreen(),
      );
    case UpdateScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const UpdateScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => Scaffold(
          body: Center(
            child: Text(
              'Page Not Found',
              style: GoogleFonts.sansita(
                fontSize: 32,
              ),
            ),
          ),
        ),
      );
  }
}
