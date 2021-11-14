import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email_signIn_textEditingController = TextEditingController();

  TextEditingController password_signIn_textEditingController =
      TextEditingController();


  @override
  void onClose() {
    email_signIn_textEditingController;
    password_signIn_textEditingController;
  }
}
