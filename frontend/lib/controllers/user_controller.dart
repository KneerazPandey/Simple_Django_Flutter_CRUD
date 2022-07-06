import 'package:frontend/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User> user = const User(
    id: '',
    email: '',
    phoneNumber: '',
    password: '',
  ).obs;

  void setUser(User newUser) {
    user.value = newUser;
  }
}
