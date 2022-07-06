import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/screens/create_book/services/create_book_service.dart';
import 'package:frontend/screens/home/screen/home_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:frontend/widgets/image_picker_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CreateBookForm extends StatefulWidget {
  const CreateBookForm({Key? key}) : super(key: key);

  @override
  State<CreateBookForm> createState() => _CreateBookFormState();
}

class _CreateBookFormState extends State<CreateBookForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool _isBookImageSelected = false;
  File? _file;
  final CreateBookService _createBookService = CreateBookService();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _languageController.dispose();
    _priceController.dispose();
  }

  Future<void> pickImage({
    required ImageSource source,
  }) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage == null) {
      return;
    }
    File temporaryImage = File(pickedImage.path);
    setState(() {
      _file = temporaryImage;
      _isBookImageSelected = true;
    });
  }

  Future<void> createBook() async {
    await _createBookService.createBook(
      context: context,
      title: _titleController.text,
      description: _descriptionController.text,
      language: _languageController.text,
      price: _priceController.text,
      bookImageFile: _file,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Book Title',
            controller: _titleController,
            prefixIcon: Icons.title,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Book Description',
            controller: _descriptionController,
            prefixIcon: Icons.description,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Book Language',
            controller: _languageController,
            prefixIcon: Icons.language,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Book Price',
            controller: _priceController,
            prefixIcon: Icons.price_check_sharp,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Text(
            'Pick Image',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImagePickerButton(
                buttonName: 'Pick Camera',
                icon: Icons.camera,
                onPressed: () async {
                  await pickImage(source: ImageSource.camera);
                },
              ),
              ImagePickerButton(
                buttonName: 'Pick Gallery',
                icon: Icons.photo,
                onPressed: () async {
                  await pickImage(source: ImageSource.gallery);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (!_isBookImageSelected)
            Text(
              'No book selected.......',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            )
          else
            Text(
              _titleController.text == ''
                  ? 'book.png'
                  : '${_titleController.text}.png',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          const SizedBox(height: 50),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (_isBookImageSelected) {
                  await createBook();
                  CustomSnackBar.showSnackBar(
                    context: context,
                    text: 'New book added successfully',
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.routeName,
                    (context) => false,
                  );
                } else {
                  CustomSnackBar.showSnackBar(
                    context: context,
                    text: 'Please select book image',
                  );
                }
              }
            },
            buttonName: 'Submit',
          ),
        ],
      ),
    );
  }
}
