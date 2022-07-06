import 'package:flutter/material.dart';
import 'package:frontend/models/book.dart';
import 'package:frontend/screens/create_book/screen/create_book_screen.dart';
import 'package:frontend/screens/detail_book/screen/detail_book_screen.dart';
import 'package:frontend/screens/home/services/book_service.dart';
import 'package:frontend/screens/home/widgets/book_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookService _bookService = BookService();
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    getbooks();
  }

  void getbooks() async {
    List response = await _bookService.getAllBooks();
    List<Book> fetchedBook = [];
    for (Map<String, dynamic> map in response) {
      fetchedBook.add(Book.fromMap(map));
    }
    setState(() {
      books = fetchedBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getbooks();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF101010),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 11, 11),
          title: Text(
            'Browse books',
            style: GoogleFonts.sansita(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailBookScreen.routeName,
                    arguments: books[index],
                  );
                },
                child: BookTile(book: books[index]),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateBookScreen.routeName);
          },
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
    );
  }
}
